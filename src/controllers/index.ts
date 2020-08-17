import FilesController from "./filesController";
import Business from "../business";
import IBusiness from "../business/IBusiness";

class Controllers {
  registerRoutes(router: any, business: IBusiness) {
    new FilesController().registerRoutes(router, business);
  }
}

export default Controllers;
