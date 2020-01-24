
file = File.open("protected/data/migrate/#{Time.now.strftime('mml_%Y-%m-%d_%H-%M')}.sql",'w')

file.puts `mysqldump -u root -p soup_mml`

file.close
