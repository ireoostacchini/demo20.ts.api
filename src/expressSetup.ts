import express from "express";
import methodOverride from "method-override";
import bodyParser from "body-parser";
import Controllers from "./controllers";
import IBusiness from "./business/IBusiness";
import { TYPES } from "./constants/types";


import { Container } from "inversify";
import Business from "./business";
import IDb from "./db/IDb";
import Db from "./db";
import DbConnectionManager from "./db/dbConnectionManager";



const router = express.Router();

const expressSetup = (app: any) => {
  app.use(bodyParser.urlencoded({ extended: true }));
  app.use(bodyParser.json());
  app.use(methodOverride());
  app.use("/api", router);

  const container = new Container();
container.bind<IBusiness>(TYPES.IBusiness).to(Business);
container.bind<IDb>(TYPES.IDb).to(Db);
//container.bind<DbConnectionManager>(TYPES.DbConnectionManager).toSelf();

  // const business = container.get<IBusiness>(TYPES.IBusiness);

  //new Controllers().registerRoutes(router, business);

  return app;
};

export default expressSetup;
