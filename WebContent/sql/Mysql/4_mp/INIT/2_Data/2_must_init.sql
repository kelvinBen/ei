INSERT INTO MP_SUBSCRIBER_TYPE(SUBSCR_TYPE_CODE, SUBSCR_TYPE_NAME ) VALUES ( 'OuterUser', '�ⲿ�û�' );  
INSERT INTO MP_SUBSCRIBER_TYPE(SUBSCR_TYPE_CODE, SUBSCR_TYPE_NAME ) VALUES ( 'ExtendUser', '��չ�û�' );  
INSERT INTO MP_SUBSCRIBER_TYPE(SUBSCR_TYPE_CODE, SUBSCR_TYPE_NAME ) VALUES ( 'User', 'ϵͳ�û�' );  



 
INSERT INTO MP_MESSAGE_TYPE(MSG_TYPE_CODE, MSG_TYPE_NAME, IS_COMMON_MSG, OBJECT_TABLE_NAME, SUBSCR_LIMIT, MANNER_LIMIT ) VALUES ( '1', '������Ϣ', '1', '', '*', 'DB;Email' );  
INSERT INTO MP_MESSAGE_TYPE(MSG_TYPE_CODE, MSG_TYPE_NAME, IS_COMMON_MSG, OBJECT_TABLE_NAME, SUBSCR_LIMIT, MANNER_LIMIT ) VALUES ( '2', '�ɹ���Ϣ', '1', '', '*', '*' );  
INSERT INTO MP_MESSAGE_TYPE(MSG_TYPE_CODE, MSG_TYPE_NAME, IS_COMMON_MSG, OBJECT_TABLE_NAME, SUBSCR_LIMIT, MANNER_LIMIT ) VALUES ( '3', '������Ϣ', '1', '', '*', '*' );  
INSERT INTO MP_MESSAGE_TYPE(MSG_TYPE_CODE, MSG_TYPE_NAME, IS_COMMON_MSG, OBJECT_TABLE_NAME, SUBSCR_LIMIT, MANNER_LIMIT ) VALUES ( '4', 'ϵͳ��Ϣ', '1', '', '*', '*' );  
INSERT INTO MP_MESSAGE_TYPE(MSG_TYPE_CODE, MSG_TYPE_NAME, IS_COMMON_MSG, OBJECT_TABLE_NAME, SUBSCR_LIMIT, MANNER_LIMIT ) VALUES ( '5', '������Ϣ', '1', '', '*', '*' ); 

INSERT INTO MP_INCEPT_MANNER(RECEIVE_MANNER_CODE, RECEIVE_MANNER_NAME ) VALUES ( 'Mail', '�ʼ�' );  
INSERT INTO MP_INCEPT_MANNER(RECEIVE_MANNER_CODE, RECEIVE_MANNER_NAME ) VALUES ( 'DB', '���ݿ�' );  

INSERT INTO MP_RECEIVE_ADDRESS(RECEIVE_ADDRESS_ID, SUBSCR_TYPE_CODE, RECEIVE_MANNER_CODE, OBJECT_TABLE_NAME, SUBSCRIBERID_FIELD, SUBSCRIBERID_FIELD_TYPE, ADDRESS_FIELD ) VALUES ( '1', 'User', 'Mail', 'PUB_USERS', 'USER_ID', 'String', 'E_MAIL' );   



  
 
