using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using MainClient.Utilities;

namespace MainClient._Model
{
    public class ViewNotesModel
    {
        public string NoteAccountNumber { get; set; }
        public string Note { get; set; }
        public DateTime? NoteCreated { get; set; }
        public string NoteRepID { get; set; }

        public static IEnumerable<ViewNotesModel> GetAcctNotesByAcctNum(string acctNum)
        {
            var acctNotes = new List<ViewNotesModel>();

            string connectionString = Connection.connectionString;

            string storedProcedure = "[dbo].[Acct_GetAcctNotesByAcctNum]";

            using (SqlConnection connection = new SqlConnection(connectionString))

            using (SqlCommand command = new SqlCommand(storedProcedure, connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@AcctNum", acctNum));

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var acctNote = new ViewNotesModel
                        {
                            NoteAccountNumber = reader["Acct Num"] as string,
                            Note = reader["Note"] as string,
                            NoteCreated = reader["Date"] as DateTime?,
                            NoteRepID = reader["Rep ID"] as string,
                        };
                        acctNotes.Add(acctNote);
                    }
                }
            }
            return acctNotes;
        }
    }
}