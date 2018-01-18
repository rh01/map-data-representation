import MySQLdb

conn = MySQLdb.connect("localhost","root","hadoop","testlighting")
cur = conn.cursor()

with open('newdata.txt','r') as f:
    lines = f.readlines()

    for i in lines:
        j=i.split('\t')
        j[1]=eval(j[1])
        j[2]=eval(j[2])
        j[3]=eval(j[3])
        j[4]=eval(j[4])
        print j[0]
        print j[1]
        print j[2]
        print j[3]
        print j[4]


        # param=(j[0],j[1],j[2],j[3],j[4])
        sql="INSERT INTO flash VALUES (%s,%d,%f,%f,%f)" %("'"+j[0]+"'",j[1],j[2],j[3],j[4])
        print sql
        cur.execute(sql)
        conn.commit()
conn.close()
