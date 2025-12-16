with open('alx_book_store.sql', 'r') as file:
    sql_script = file.read()
    
for file in sql_script.split(';'):
    if file.strip():
        print(f"{file};")
        