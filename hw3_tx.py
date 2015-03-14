import cx_Oracle, sys
con = cx_Oracle.connect('om', 'om', 'xe')
cur = con.cursor()

def main():
    
    print "Welcome to Parthura Radio!"

    user =""
    password = ""
    user_sql =" "
    pass_sql = " "
    

    while ( user_sql != user) and ( pass_sql != password):
        user_unstrip = raw_input("Username: ")
        password_unstrip = raw_input("Password: ")

        user = user_unstrip.rstrip('\n')
        password = password_unstrip.rstrip('\n')

        user_pass = cur.execute("SELECT LOGIN, PASSWORD FROM CUSTOMERS WHERE LOGIN = :1 and PASSWORD = :2", (user, password))
        user_pass = list(user_pass)

        if user_pass == []:
            print"Invalid username or password. Please try again."
            continue
        else:
            user_sql, pass_sql = user_pass[0]

        
    """
        sql = "select \"LOGIN\", \"PASSWORD\" from \"CUSTOMER\" where \"LOGIN\" =:user and \"PASSWORD\" = :password"
        user_pass = cur.execute(sql,user=user,password=password)


        cur.prepare("select * from :variable")
        cur.execute(None,{'variable':p})
        res=cur.fetchall()


        stmt = "SELECT LOGIN, PASS \
            FROM CUSTOMERS     \
            WHERE LOGIN = '%s' \
                    AND PASS = '%s';"%(user, password)

        user_pass = cur.execute(stmt)
        user_pass = list(user_pass)

        user_sql, pass_sql = log_pass[0]
    """
    
    print "*** Please enter one of the following options ***\nsearch <song_title | song_artist | song_album>\nplan [<plan_id>]\nplay <song_id>\nquit"
    option = raw_input()

    if option[0:6] == "search":
        search = option[7:]
        print "Searching for %s" %search
        #query for search item through song name, song artist, and song album
        
    elif option[0:4] == "plan":
        plan = option[5:]
        if plan == "":
            print "\nID: 1, NAME: Basic, QUOTA: 5, FEE: 1.99\nID: 2, NAME: Plus, QUOTA: 12, FEE: 2.99\nID: 3, NAME: Premium, QUOTA: 40, FEE: 8.99\n"
        elif plan == "1":
            #alter plan ID for the customer to this new plan ID
            print "Switched to plan 1"
        elif plan == "2":
            #alter plan ID for the customer to this new plan ID
            print "Switched to plan 2"
        elif plan == "3":
            #alter plan ID for the customer to this new plan ID
            print "Switched to plan 3"
        else:
            print "Error: Invalid plan"
            
    elif option[0:4] == "play":
        song = option[4:]
        #check if plan limit is exceeded by playing this song
        #query for song ID. Check if song has been played and print out


def test():
    n="5"
    while n != "3":
        n = raw_input("while: ")

main()
