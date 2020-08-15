import express from "express";
import expressSetup from "./expressSetup";
const app = express();
const port = 8080; // default port to listen

module.exports = expressSetup(app);

// ## It is not safe to resume normal operation after 'uncaughtException'. Restart the process carefully using a process management tool like PM2
// https://nodejs.org/api/process.html#process_warning_using_uncaughtexception_correctly
process.on("uncaughtException", (err) => {
  process.exit(-1);
});

// ## Catch unhandled promise rejections
process.on("unhandledRejection", (reason, promise) => {
  process.exit(-1);
});

// start the Express server
app.listen(port, () => {
  // tslint:disable-next-line:no-console
  console.log(`server started at http://localhost:${port}`);
});
