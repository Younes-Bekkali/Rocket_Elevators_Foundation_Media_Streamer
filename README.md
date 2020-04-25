# **Week 11 - Elevators Media Streamer ** 



#<b>Foundation week:Rebuild its information system in Individual mode</b>
# <b>A .NET Core API deployed on Microsoft Azure</b>
# <b>Intervations form with the Zendex API feature added</b>

**Week 9 - Foundation week ** 

** Younes Bekkali **

1) a new interventions table is added to the mysql database, database name: YounesDeploy
2) an intervention form is added to the web site:
 - the website adress: http://rocketelvators.com
 - you can either acces to the form from the Homepage menu next to contacts, or form the dashboard of the back office where   you can also access to the interventions database.
 
for the ahthentification:
log in: admin@example.com, password: Codeboxx1!

3) Creating new GET requests in the REST API
- the link for the repository: https://github.com/yobek-lab/Rocket-Elevator-Foundation-RestApi_2.git
- the link for the azure deployment: https://rocketelevatorsapi.azurewebsites.net/

for testing using Postman: take the intervention number 2 as an example

{
    "id": 2,
    "status": "Pending",
    "battery_id": 5,
    "author": 101,
    "customer_id": 4,
    "building_id": 6,
    "column_id": 71,
    "elevator_id": 12,
    "employee_id": 23,
    "start_intervention": null,
    "end_intervention": null,
    "result": "second result",
    "report": "string"
}
GET https://localhost:5001/api/intervention/PendingList .. to get all the interventions status that are Pending

PUT: https://localhost:5001/api/intervention/InProgress/2 .. to make the intervention status to InProgress, and having a staring date, and time

PUT: https://localhost:5001/api/intervention/Completed/2 ..to make the intervention status Completed, and having en ending date, and time



https://localhost:5001/api/intervention/PendingList
**Week 8 - Offer Services on the Internet ** 

**Team:** 

>1. Ukeme Ekpenyong (Team Leader)
>2. Anna Chowattanakul
>3. Younes Bekkali
>4. David Hunter
>5. Jorge Chavarriaga

*To answer the 9 questions with [*Postman:](https://www.getpostman.com/collections/a5cd3bfab68ca5d11069)*
Click the Postman link if you want to import our collection into your Postman domain

1. Retrieving the current status of a specific **Battery**:

**GET:** https://rocketapi.azurewebsites.net/api/battery/69 - *(69 the battery id)* - **SEND**

2. Changing the status of a specific **Battery**:

**PUT:** https://rocketapi.azurewebsites.net/api/battery/69 - *(69 the battery id)*

Select: >Body >raw >JSON

{
        "id": 69,
        "building_id": 69,
        "employee_id": 2,
        "battery_type": "Corporate",
        "status": "active"
}

To change the status: "status": "active" or "inactive"  and press **SEND**

Response:

**The status of the Battery Id: 69 has been changed to: inactive**
To review changes, refer to the first step.

3. Retrieving the current status of a specific **Column**:

**GET:** https://rocketapi.azurewebsites.net/api/column/69 - *(69 the battery id)* - **SEND**

4. Changing the status of a specific **Column**:

**PUT:** https://rocketapi.azurewebsites.net/api/column/69 - *(69 the battery id)*

Select: >Body >raw >JSON

{
        "id": 69,
        "column_type": "Residential",
        "number_floors": 6,
        "status": "inactive",
        "info": "Auxilium ipsa nihil textilis ultio.",
        "notes": "Auxilium ipsa nihil textilis ultio.",
        "battery_id": 24
}

To change the status: "status": "active" or "inactive"  and press **SEND**

Response:

**The status of the Column Id: 69 has been changed to: inactive**
To review changes, refer to the third step.

5. Retrieving the current status of a specific **Elevator**:

**GET:** https://rocketapi.azurewebsites.net/api/elevator/69 - *(69 the elevator id)* - **SEND**

6. Changing the status of a specific **Elevator**:

**PUT:** https://rocketapi.azurewebsites.net/api/elevator/69 - *(69 the elevator id)* 

Select: >Body >raw >JSON

{
    "id": 69,
    "column_id": 20,
    "status": "active"
}

To change the status: "status": "active" or "inactive"  and press **SEND**

Response:

**The status of the Elevator Id: 69 has been changed to: inactive**
To review changes, refer to the fifth step.

7. Retrieving a list of **Elevators** that are not in operation at the time of the request:

**GET:** https://rocketapi.azurewebsites.net/api/elevator/notinoperation - **SEND**

8. Retrieving a list of **Buildings** that contain at least one battery, column or elevator requiring intervention:

**GET:** https://rocketapi.azurewebsites.net/api/building/intervention - **SEND**

9. Retrieving a list of **Leads** created in the last 30 days who have not yet become customers:

**GET:** https://rocketapi.azurewebsites.net/api/lead/notcustomers - **SEND**

# <b>You can also use the following options:</b>
* https://rocketapi.azurewebsites.net/api/battery/all - To retrieve all the batteries availables
* https://rocketapi.azurewebsites.net/api/battery/active - To retrieve all the active batteries
* https://rocketapi.azurewebsites.net/api/battery/inactive - To retrieve all the inactive batteries 
* https://rocketapi.azurewebsites.net/api/column/all - To retrieve all the columns
* https://rocketapi.azurewebsites.net/api/column/active - To retrieve the active columns
* https://rocketapi.azurewebsites.net/api/column/inactive - To retrieve the inactive columns
* https://rocketapi.azurewebsites.net/api/building/all - To retrieve all the buildings
* https://rocketapi.azurewebsites.net/api/building/69 - To retrieve an specific building 
* https://rocketapi.azurewebsites.net/api/customer/all - To retrieve all the customers
* https://rocketapi.azurewebsites.net/api/lead/all - To retrieve all the leads
