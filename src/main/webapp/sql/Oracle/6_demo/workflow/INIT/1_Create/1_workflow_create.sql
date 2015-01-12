CREATE TABLE CLBX
(
                CodeId VARCHAR (36) NOT NULL ,
                BXR VARCHAR (12) ,
                Department VARCHAR (20) ,
                TXRS VARCHAR (4) ,
                CFD VARCHAR (20) ,
                BXSUM VARCHAR (20) ,
                CCSY VARCHAR (50) 
) ;
ALTER TABLE CLBX
    ADD CONSTRAINT Clbx_PK 
    PRIMARY KEY (CodeId);