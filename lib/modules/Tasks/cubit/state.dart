abstract class TodoStates {}
 class InitialTodoState extends TodoStates{}
class InsertDataState extends TodoStates{}
class GetDataState extends TodoStates{}
class ErrorInsertToDatabaseState extends TodoStates{}

class DeleteFromDatabaseState extends TodoStates{}
class UpdateDatabaseState extends TodoStates{}

class BoxCheckState extends TodoStates{}