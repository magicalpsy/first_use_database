import os, re, pymysql, requests
from flask import request, redirect, abort, render_template, session, Flask, jsonify
from datetime import datetime
from selenium import webdriver
from bs4 import BeautifulSoup

app = Flask(__name__, 
            static_folder="static",
           template_folder="template")

app.config['ENV'] = 'development'
app.config['DEBUG'] = True
app.secret_key = b'jaesang'

db = pymysql.connect(
    user = 'root',
    passwd = 'new1234',
    host='localhost',
    db='newspaper',
    charset='utf8',
    cursorclass=pymysql.cursors.DictCursor
)
#JSON 파일로 넘겨 주는 방법에 대해 공부해서 추후 업데이트 필요 해야 함.
def global_test(text_list):
    global temp_publiser
    temp_publiser = text_list


# 신문사 박준호 email-주소 기사 Title
# 중앙일보 박준호
# publiser_list = [("중앙일보", "박준호", email), ("중앙일보", "박준호", email)]
# new = [p for p in publisher_list if p[0] == '중앙일보']
# new = [p for p in publisher_list if p[0] == '중앙일보' and p[1] == '박준호']
# def view_newspaper():
#     return pass
def get_today_article():
    publiser_list = []
    news_list=[]
    options = webdriver.ChromeOptions()
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    driver = webdriver.Chrome('chromedriver.exe', options=options)
    driver.implicitly_wait(3)
    url = "https://news.daum.net/politics"
    driver.get(url)
    soup = BeautifulSoup(driver.page_source, 'html.parser')
    # 각 주요 기사에 접속 하기 위한 주소 추출
    for w in soup.select('.tit_thumb a'):
        news_list.append(w['href'])
        
    for w in news_list:
        templist = []
        news_res = requests.get(w)
        soup = BeautifulSoup(news_res.content, 'html.parser')
        # 기자 이름 추출
        reporter_name = (soup.select(".txt_info")[0].get_text(','))
        #email-address 추출 (기사 하나에 여러개의 email 있어 마지막의 email 만 추출)
        p = soup.select(".article_view")[0].get_text()
        emailReg = re.compile(r'([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4})')
        reporter_name = soup.select(".txt_info")[0].get_text().split()
        emailaddress = emailReg.findall(p)
        if len(emailaddress) < 1:
            emailaddress = None
        else:
            emailaddress = emailaddress[-1]

        # 헤드라인 추출 
        title = soup.select(".tit_view")[0].get_text()
#         publiser_sentence = soup.select(".tit_cp")[0].get_text().split()
        # 신문사 추출 
        newspubliser = soup.select(".tit_cp")[0].get_text().split()
#         newspubliser = publiser_sentence.split()
        # 2차원 배열 을 만들기 위한 리스트 추가 ex:) [ [중앙일보,박일호,email,기사], [중앙일보,박이호,email,기사]]
        templist.append(newspubliser[0])
        templist.append(reporter_name[0])
        templist.append(emailaddress)
        templist.append(title)
        publiser_list.append(templist)
#     print(publiser_list)
    return publiser_list
def make_recently_table(publiser_list, select_newspaper):
    macro = ""
    headline_all = ""
    for index, w in enumerate(publiser_list):
        macro += f"""
            <tr>
                <td>{w[0]}</th>
                <td>{w[1]}</th>
                <td>{w[2]}</th>
            </tr>
          """
        headline_all += w[2].replace('"', '').replace("'"," ")
#       SQL 개행문자 입력 방법 추후 확인
        headline_all += '\n'

    table_text=f"""
        <table class="type11">
            <thead>
                <tr>
                    <th scope="cols" colspan="3"> 오늘의 주요 기사 중 {select_newspaper} 기사</th>
                </tr>
                <tr>
                    <th scope="cols">신문사</th>
                    <th scope="cols">기사</th>
                    <th scope="cols">headline</th>
                </tr>
            </thead>
            <tbody>
                {macro}
            </tbody>
            </table>
        """
    # #     UPDATE `cwaling_newspaper` SET `headline`="12345" WHERE `reportor` = '박재상' AND `newspaper` = 'AI일보'
    sql = f"""UPDATE `cwaling_newspaper` SET `headline` = '{headline_all}'
            WHERE `reportor` = {w[1].replace('"',"'")} AND `newspaper` = {w[0].replace('"',"'")}
            """
    print(sql)
    cursor = db.cursor()
    cursor.execute(sql)
    db.commit()
    # table
    return table_text
def make_table(publiser_list, select_newspaper):
    macro = ""

    for w in publiser_list:
        if "ALL" in select_newspaper :
            macro += f"""
            <tr>
                <td>{w[1]}</th>
                <td>{w[2]}</th>
                <td>{w[3]}</th>
                <td> 
                    <form action='/recetly_news_view?newspaper="{w[0]}"&reporter="{w[1]}"' method='post'>
                        <button type = 'submit'> 추가 기사 확인</button>
                    </form> 
                </th>
            </tr>
            """
        elif select_newspaper in w:
            macro += f"""
            <tr>
                <td>{w[1]}</th>
                <td>{w[2]}</th>
                <td>{w[3]}</th>
                <td> 
                    <form action='/recetly_news_view?newspaper="{w[0]}"&reporter="{w[1]}"' method='post'>
                        <button type = 'submit'> 추가 기사 확인</button>
                    </form> 
                </th>
            </tr>
            """
    lne_publiser_list= len(publiser_list)
    table_text=f"""
        <table class="type11">
            <thead>
                <tr>
                    <th scope="cols" colspan="4"> 오늘의 주요 기사 중 {select_newspaper} 기사</th>
                </tr>
                <tr>
                    <th scope="cols">기자</th>
                    <th scope="cols">email</th>
                    <th scope="cols">headline</th>
                    <th scope="cols">최근 기사 추가</th>
                </tr>
            </thead>
            <tbody>
                {macro}
            </tbody>
            </table>
        """

    return table_text

@app.route("/recetly_news_view", methods=['GET', 'POST'])
def recetly_news_view( ):
    if request.method == 'POST':
        return redirect("/")
    newspaper = request.args.get('newspaper')
    repoter = request.args.get('reporter')
    options = webdriver.ChromeOptions()
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    driver = webdriver.Chrome('chromedriver.exe', options=options)
    driver.implicitly_wait(3)
    driver.get('http://daum.co.kr/')
    driver.find_element_by_css_selector("#q").clear()
    driver.find_element_by_css_selector("#q").send_keys(f"{newspaper} {repoter}")
    driver.find_element_by_css_selector("#daumSearch > fieldset > div > div > button.ico_pctop.btn_search").click()
    soup = BeautifulSoup(driver.page_source, 'html.parser')
    
    recetly_news_view = ""
    make_list = []
    for w in soup.select("#newsColl .coll_cont .wrap_tit .f_link_b"):
        temp_make_list = []
        temp_make_list.append(newspaper)
        temp_make_list.append(repoter)
        temp_make_list.append(str(w.get_text()) )
        make_list.append(temp_make_list)
        
    get_table = make_recently_table(make_list, newspaper)
    return render_template('receltly_news.html',
                 table=get_table,
                action = "메인페이지 이동" ,
                form_action = "/recetly_news_view"
                           
                 )



def get_menu(publiser_list):
    select_option_base=""
    diff_publiser_list = []
    for num, w in enumerate(publiser_list):
        if w[0] not in diff_publiser_list:
            select_option_base += f"""<OPTION VALUE="{w[0]}" >{w[0]}</OPTION>\n"""
            diff_publiser_list.append(w[0])
    menu = f"""<SELECT NAME=slenewspaper>
            {select_option_base}
         </SELECT><br>"""
    return menu

@app.route("/save_NewsPaper_db", methods=['GET', 'POST'])
def save_NewsPaper_db():
    get_table=""
    menu= ""
    cursor = db.cursor()
    publiser_list = temp_publiser
    for num, w in enumerate(publiser_list):
        print(w)
        replace_headline = w[3].replace('"', '').replace("'"," ")
        print(replace_headline)
        sql = f"""
            insert into Cwaling_NewsPaper (`newspaper`, `reportor`, `e-mail`, `headline`)
            values('{w[0]}','{w[1]}', '{w[2]}', '{replace_headline}')
            """
        cursor.execute(sql)
        db.commit()
    return redirect("/get_article_db")


@app.route("/search_today_article" , methods=['GET', 'POST'])
def search_today_article():
    table = ""
    get_menu_nal = ""
    get_table = ""
    if request.method == 'POST':
        publiser_list = get_today_article()
        select_option_base=""
        diff_publiser_list = []
        get_table = make_table(publiser_list, "ALL")
        temp_publiser = publiser_list

    global_test(publiser_list)
    return render_template('base.html',
                        menu="",
                        table=get_table,
                        title="",
                        action="DB 저장",
                        form_action="/save_NewsPaper_db")

@app.route("/get_article_db" , methods=['GET', 'POST'])
def get_article_db():
    cursor = db.cursor()
    cursor.execute(f"""select * from Cwaling_NewsPaper""")
    temp_make_list = []
    make_list = []
    for w in cursor.fetchall():
        temp_make_list = []
        temp_make_list.append(w['newspaper'])
        temp_make_list.append(w['reportor'])
        temp_make_list.append(w['e-mail'])
        temp_make_list.append(w['headline'])
        make_list.append(temp_make_list)
        
    if request.method == 'POST':
        select = request.form.get('slenewspaper')
        get_table = make_table(make_list, str(select))
    else:
        get_table = make_table(make_list, make_list[0][0])
    
    return render_template('base.html',
                        menu=get_menu(make_list),
                        table=get_table,
                        title="",
                        action="기사 조회",
                        form_action="/get_article_db"
                    )

@app.route("/")
def index():
    if 'user' in session:
        return redirect("/get_article_db")
    else:
        return redirect("/login")

@app.route("/sign_up",methods=['GET', 'POST'])
def sign_up():
    message=""
    cursor = db.cursor()
    if request.method == 'POST':
        print("*"*100)
        sql = f"""
            insert into login_user (name, password)
            values('{request.form['id']}', SHA2({request.form['pw']},256))
        """
        cursor.execute(sql)
        db.commit()
        return redirect("/login")
    
    return render_template('login.html',
                        message=message,
                        title="ID 가 없습니다. ID 와 PW 를 추가해 주세요",
                        text="회원 가입",
                        form_action="/sign_up" )

@app.route('/login' , methods=['GET', 'POST'])
def login():
    message = ""
    if request.method == 'POST':
        cursor = db.cursor()
        cursor.execute(f"""select id,name, password from login_user 
                       where name = '{request.form['id']}'""")
        user = cursor.fetchone()
        print(user)
        if user is None:
            message ="<p> 회원이 아닙니다.</p>"
            return redirect("/sign_up")
        else:
            cursor.execute(f"""
            select id, name, password from login_user
            where name = '{request.form['id']}' and 
            password = SHA2('{request.form['pw']}',256) """)
            user = cursor.fetchone()
            if user is None:
                message = "<p> 패스워드를 확인해 주세요</p>"
            else:
                session['user'] = user
                return redirect("/get_article_db")
            
    return render_template('login.html',
                        message=message,
                        title="로그인 페이지",
                        text="로그인",
                        form_action="/login")

app.run(port = 8000)
    