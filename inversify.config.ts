import { Container } from "inversify";
import IBusiness from "./src/business/IBusiness";
import Business from "./src/business";
import IDb from "./src/db/IDb";
import Db from "./src/db";
import DbConnectionManager from "./src/db/dbConnectionManager";
import { TYPES } from "./src/constants/types";

const container = new Container();
container.bind<IBusiness>(TYPES.IBusiness).to(Business);
container.bind<IDb>(TYPES.IDb).to(Db);
container.bind<DbConnectionManager>(TYPES.DbConnectionManager).toSelf();

export default container;
