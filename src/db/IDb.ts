import FilesRepository from "./filesRepository";
import DbConnectionManager from "./dbConnectionManager";

interface IDb {
  dbConnectionManager: DbConnectionManager;

  filesRepository(): FilesRepository;
}

export default IDb;
