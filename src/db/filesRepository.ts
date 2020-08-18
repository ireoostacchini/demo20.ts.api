import FileEntity from "../entities/FileEntity";
import DbConnectionManager from "./dbConnectionManager";

class FilesRepository {
  private _dbConnectionManager: DbConnectionManager;

  constructor(dbConnectionManager: DbConnectionManager) {
    this._dbConnectionManager = dbConnectionManager;
  }

  async getFiles() {
    const knex = this._dbConnectionManager.getKnex();
    const files = await knex("files");

    const result = files.map((file: any) => {
      const entity: FileEntity = {
        id: file.id,
        name: file.name,
        type: file.type,
        userId: file.user_id,
        duration: file.duration,
        size: file.size,
      };

      return entity;
    });

    return result;
  }
}

export default FilesRepository;
