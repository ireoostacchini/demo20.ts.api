// https://stackoverflow.com/questions/37534890/inversify-js-reflect-hasownmetadata-is-not-a-function
import "reflect-metadata";
import FilesManager from "./filesManager";
import Db from "../db";
import FileEntity from "../entities/FileEntity";

const data: FileEntity[] = [
  { id: "12345", name: "hi", type: "mp4", userId: "xyz" },
  { id: "67890", name: "hi again", type: "wav", userId: "abcd" },
];
const mock = jest.fn((x) => data);

jest.mock("../db/filesRepository", () => {
  return jest.fn().mockImplementation(() => {
    return { getFiles: mock };
  });
});

describe("FileManager", () => {
  it("can get files", async () => {
    const filesManager = new FilesManager(new Db(null));

    const result = await filesManager.getFiles();

    expect(result).toEqual(data);
  });
});
