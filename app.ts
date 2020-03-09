import express, { Application } from "express";
import cluster from "cluster";
import morgan from "morgan";
import bodyParser from "body-parser";

// Routes
import IndexRoutes from "./routes/index.routes";
import UserRoutes from "./routes/users.routes";
import BookRouter from "./routes/books.routes";
import CategoryRouter from "./routes/categories.routes";

export class App {
  app: Application | undefined; //creation of the propertie "application"

  constructor(
    private port?: number | string //
  ) {
    if (cluster.isMaster) {
      //If it's master thread, I will create 1 thread per cpu the cp has
      let cpuCount: number = require("os").cpus().length;
      for (let i = 0; i < cpuCount; i++) {
        cluster.fork();
      }
      // Listen for dying threads
      cluster.on("exit", function(thread) {
        console.log(`Thread ${ thread.id } died `);
        cluster.fork();
      });
    } else {
      //functions which contains my whole app.
      this.app = express(); //app type aplication receive "express()"
      this.settings(); //add settings
      this.middlewares(); //add middlewares
      this.routes(); //add routes
    }
  }

  private settings() {
    this.app?.set("port", this.port || process.env.PORT || 3000); // if there is not PORT = ${number}, default 3000
  }

  private middlewares() {
    this.app?.use(morgan("dev")); //Morgan establishment
    this.app?.use(express.json());
    this.app?.use(
      bodyParser.urlencoded({
        extended: true
      })
    );
  }

  private routes() {
    this.app?.use("/", IndexRoutes); //main route.
    this.app?.use("/users", UserRoutes); //User route.
    this.app?.use("/books", BookRouter); //Book route.
    this.app?.use("/categories", CategoryRouter); //Category route.
  }

  async listen(): Promise<void> {
    await this.app?.listen(this.app.get("port"));
    console.log(
      ` ${
        !cluster.isMaster
          ? `Server Thread nº ${
              cluster.worker.id
            } listening port ${this.app?.get("port")}`
          : "Server Master displayed"
      } `
    );
  }
}
