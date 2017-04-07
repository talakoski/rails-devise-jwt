
Test without JWT:

    curl --header http://localhost:3000/

Get the JWT token from Authorization header:

    Edit application_controller.rb:

        #protect_from_forgery with: :exception
        protect_from_forgery with: :null_session

    curl -i -X POST -d "user[email]"="admin@example.com" -d "user[password]"="12345678" http://localhost:3000/users/sign_in

Test with JWT:

    curl --header "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEsInNjcCI6InVzZXIiLCJpYXQiOjE0OTEzOTMzNjYsImV4cCI6MTQ5MTM5Njk2NiwianRpIjoiNDU5MzQ5ZjEtZTM2Ny00MmQ2LWI5NzEtYTAwM2FlMmQ0MGRlIn0.QqxdyenDVoAu4z47481fhuNpVJbxYPTxWyy_DG_BEts" http://localhost:3000/

Test API:

    curl -i --header "Content-Type: application/json" -X POST -d '{"email":"admin@example.com","password":"12345678"}' http://localhost:3000/api/v1/authentication_tokens/create

    curl --header "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEsInNjcCI6InVzZXIiLCJpYXQiOjE0OTEzOTY2MzksImV4cCI6MTQ5MTQwMDIzOSwianRpIjoiOTk0Yjg3NjgtYzU2Zi00ODQ3LWEwYTItZjc1NGM3ZWQ0NzE2In0.e9X8tK0PJmINJB892GJZkTp4tIv9gDU7ZuyU4TTNlyw" http://localhost:3000/api/v1/users.json
