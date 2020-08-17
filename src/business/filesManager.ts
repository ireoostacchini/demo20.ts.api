import FileEntity from "../entities/FileEntity";
import FileDto from "../dto/FileDto";
import IDb from "../db/IDb";

class FilesManager {
  private _db: IDb;

  constructor(db: IDb) {
    this._db = db;
  }
  async getFiles(): Promise<FileDto[]> {
    const entities = await this._db.filesRepository().getFiles();

    const dtos = entities.map((entity: FileEntity) => {
      const dto: FileDto = {
        id: entity.id,
        name: entity.name,
        type: entity.type,
        userId: entity.userId,
        duration: entity.duration,
        size: entity.size,
      };

      return dto;
    });

    return dtos;
  }
}

export default FilesManager;
