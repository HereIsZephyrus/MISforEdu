//
//  Interface_sql_server.hpp
//  MISforEdu
//
//  Created by ChanningTong on 2/12/24.
//
/*
#ifndef Interface_sql_server_hpp
#define Interface_sql_server_hpp

#include <stdio.h>
#include <iostream>
#include <string>
#include <sql.h>
#include <sqlext.h>

class Interface {
public:
    Interface(const std::string& connectionString)
        : m_connectionString(connectionString),
    {
        // 初始化数据库连接
        SQLAllocHandle(SQL_HANDLE_ENV, SQL_NULL_HANDLE, &m_environmentHandle);
        SQLSetEnvAttr(m_environmentHandle, SQL_ATTR_ODBC_VERSION, (SQLPOINTER)SQL_OV_ODBC3, 0);
        SQLAllocHandle(SQL_HANDLE_DBC, m_environmentHandle, &m_connectionHandle);

        // 连接到 SQL Server
        SQLCHAR connStr[1024];
        SQLSMALLINT connStrLength;
        SQLDriverConnect(m_connectionHandle, NULL, (SQLCHAR*)m_connectionString.c_str(),
            SQL_NTS, connStr, sizeof(connStr), &connStrLength, SQL_DRIVER_COMPLETE);
    }

    void ExecuteQuery(const std::string& query) {
        SQLHSTMT statementHandle;
        SQLAllocHandle(SQL_HANDLE_STMT, m_connectionHandle, &statementHandle);
        SQLExecDirect(statementHandle, (SQLCHAR*)query.c_str(), SQL_NTS);

        // 处理查询结果
        SQLLEN rowCount;
        SQLRowCount(statementHandle, &rowCount);
        std::cout << "Query executed successfully. Rows affected: " << rowCount << std::endl;

        SQLFreeHandle(SQL_HANDLE_STMT, statementHandle);
    }

    // 添加其他与 SQL Server 数据库相关的方法和功能...

    ~Interface() {
        // 断开与 SQL Server 的连接
        SQLDisconnect(m_connectionHandle);
        SQLFreeHandle(SQL_HANDLE_DBC, m_connectionHandle);
        SQLFreeHandle(SQL_HANDLE_ENV, m_environmentHandle);
    }

private:
    std::string m_connectionString;
    SQLHENV m_environmentHandle;
    SQLHDBC m_connectionHandle;
};

#endif

*/
