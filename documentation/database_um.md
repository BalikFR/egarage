# UML de la Base de Données

Ce document décrit le schéma UML de la base de données utilisée dans le projet eGarage. Le diagramme de classes UML présente les différentes tables de la base de données et les relations entre elles.

## Diagramme UML

```plaintext
+----------------------+       +-----------------------+       +-------------------+
|       `client`       |       |     `mechanical`      |       |   `appointment`   |
+----------------------+       +-----------------------+       +-------------------+
| - pid: INT           |       | - docid: INT          |       | - appid: INT      |
| - pemail: VARCHAR    |       | - docemail: VARCHAR   |       | - client: INT     |
| - pname: VARCHAR     |       | - docname: VARCHAR    |       | - doctor_id: INT  |
| - ppassword: VARCHAR |       | - docpassword: VARCHAR|       | - appdate: DATE   |
| - paddress: VARCHAR  |       | - docaddress: VARCHAR |       | - apptime: TIME   |
| - pnic: VARCHAR      |       | - docnic: VARCHAR     |       +-------------------+
| - pdob: DATE         |       | - docdob: DATE        |     
| - ptel: VARCHAR      |       | - doctel: VARCHAR     |      
+----------------------+       +-----------------------+      
          |                              |                          
          |                              |                          
          |                              |                          
          +---------------+--------------+                          
                          |                                      
                          |                                      
                +---------v-----------+                           
                |      `webuser`      |                           
                +---------------------+                           
                | - email: VARCHAR    |                           
                | - usertype: VARCHAR |                           
                +---------------------+
```