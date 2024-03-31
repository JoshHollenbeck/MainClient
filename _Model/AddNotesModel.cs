using System.Data.SqlClient;
using MainClient.Utilities;
using System;

namespace MainClient._Model
{
    public class AddNotesModel
    {
        public static void InsertAcctNotesByAcctNum(string acctNum, string noteText, string repId)
        {
            string connectionString = Connection.connectionString;
            string storedProcedure = "[dbo].[Acct_InsertAcctNotesByAcctNum]";

            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand(storedProcedure, connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@AcctNum", acctNum));
                command.Parameters.Add(new SqlParameter("@Note", noteText));
                command.Parameters.Add(new SqlParameter("@RepId", repId));

                connection.Open();
                Console.WriteLine($"Executing stored procedure for AcctNum: {acctNum}, Note: {noteText}, RepId: {repId}");
                command.ExecuteNonQuery();
            }
        }
    }
}
