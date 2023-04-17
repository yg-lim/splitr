const express = require("express");
const morgan = require("morgan");
const config = require("./lib/config");

const app = express();
const PORT = config.PORT;
const HOST = config.HOST;
const PgPersistence = require("./lib/pg-persistence");
const catchError = require("./lib/catch-error");

app.set("view engine", "pug");

app.use(morgan("common"));
app.use(express.static("public"));
app.use((req, res, next) => {
  res.locals.store = new PgPersistence();
  next();
});

app.get("/", 
  catchError(async (req, res) => {
    res.render("split-lists");
  })
);

app.get("/new-list",
  catchError(async (req, res) => {
    res.render("new-list");
  })
);

app.use((err, req, res, _next) => {
  console.log(err.message);
  res.status(404).send(err.message);
});

app.listen(PORT, HOST, () => { console.log(`listening on ${PORT}`)} );