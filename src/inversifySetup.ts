import { Container } from "inversify";
import IBusiness from "./business/IBusiness";
import Business from "./business";
import IDb from "./db/IDb";
import Db from "./db";
import DbConnectionManager from "./db/dbConnectionManager";
import { TYPES } from "./constants/types";
import IDbConnectionManager from "./db/IDbConnectionManager";

const container = new Container();
container.bind<IBusiness>(TYPES.IBusiness).to(Business);
container.bind<IDb>(TYPES.IDb).to(Db);
container.bind<IDbConnectionManager>(TYPES.DbConnectionManager).to(DbConnectionManager);

export default container;
