import pymysql
import random

# 记得修改信息哦
conn = pymysql.connect(host="127.0.0.1",user ="xxxxxx", password ="xxxxxx",database ="design",charset ="utf8",port = 3306)
# 得到一个可以执行SQL语句的光标对象
cur = conn.cursor()


# 表
def view(table):
    if table == 'Item':
        sql = 'select * from Item'
    else:
        sql = 'select * from Equipment'
    cur.execute(sql)
    rows = cur.fetchall()
    # 取得记录个数，用于设置表格的行数
    row = cur.rowcount
    # 取得字段数，用于设置表格的列数
    vol = len(rows[0])
    a = (rows,row,vol)
    conn.commit()
    return a

#任务
def viewTask(tstatus):
    if tstatus == 'fin':
        sql = "SELECT * FROM Task WHERE tstatus = 'fin'"
    else:
        sql = "SELECT * FROM Task WHERE tstatus = 'unfin'"
    cur.execute(sql)
    rows = cur.fetchall()
    # 取得记录个数，用于设置表格的行数
    row = cur.rowcount
    # 取得字段数，用于设置表格的列数
    vol = len(rows[0])
    a = (rows,row,vol)
    conn.commit()
    return a

# 属性
def role(RID=''):
    cur.execute("SELECT * FROM Role Where RID = %s",RID)
    raw = cur.fetchone()
    #(RID,PID,level,strength,speed,intelligence,profession,hitem,hequipment,tunderway)
    # ('1','1','1','10',     '20', '10',        'wiz',    '1',   '3',       '1')
    cur.execute("SELECT ename FROM Role r, Equipment e where r.RID = %s AND r.hequipment = e.EID;", RID)
    data = list(raw)
    data.append(list(cur.fetchone()))
    conn.commit()

    return data

#提交
def submit(index):
    cur.execute("UPDATE Task SET tstatus = 'fin' WHERE TID = %s ",index) #改状态
    conn.commit()

def giveup(index):
    cur.execute("UPDATE Task SET tstatus = (case when ttype = 'dec' then 'unfin' else 'fin' end) WHERE TID = %s",index) #改状态
    conn.commit()

def box():
    c = random.randint(1, 3)
    cur.execute("select EID from Equipment order by EID DESC limit 1")
    index = list(cur.fetchone())[0]
    index = index+1
    if (c == 1):
        cur.execute("INSERT INTO Equipment(EID, RID, ename, type, plimit, llimit, edisc, attack, defence) VALUE ('%s','1', 'bow', 'bow', 'arc', '1', 'a ranged weapon system consisting of an elastic launching device', '6', '1');",index)
    elif(c == 2):
        cur.execute("INSERT INTO Equipment(EID, RID, ename, type, plimit, llimit, edisc, attack, defence) VALUE ('%s','1', 'hatchet', 'axe', 'ber', '5', 'a single-handed striking tool with a sharp blade on one side', '5', '3');",index)
    else:
        cur.execute("INSERT INTO Equipment(EID, RID, ename, type, plimit, llimit, edisc, attack, defence) VALUE ('%s','1', 'dagger', 'sword', 'sman', '5', 'a short knife with high danger', '9', '0');",index)
    conn.commit()

def equip(EID,limit):
    cur.execute("UPDATE Role r join Equipment e on r.RID = e.RID SET r.hequipment = (case when r.profession = %s then %s else r.hequipment end)",(limit,EID))
    conn.commit()

def drop(id):
    cur.execute("DELETE FROM Equipment WHERE EID = %s", id)
    conn.commit()

