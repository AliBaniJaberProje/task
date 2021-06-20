package task1.database;

import java.sql.ResultSet;
import java.sql.Statement;

public class DatabaseDriver {

    public static   ResultSet db_executor(String SQL,boolean update_query ){
        ResultSet rs=null;
        try{
            Statement stmt=DatabaseConnection.getUniqueConnection().createStatement();
            if(!update_query)
                rs=stmt.executeQuery(SQL);
            else
                stmt.executeUpdate(SQL);


        }catch(Exception e){ System.out.println(e);}
        return rs;
    }

}
