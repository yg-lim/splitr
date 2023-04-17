const { Client } = require("pg");
const config = require("./config");
const isProduction = config.NODE_ENV === "production" ? { rejectUnauthorized: false } : false;

const CONNECTION = {
  connectionString: config.DATABASE_URL,
  ssl: isProduction,
};

function logQuery(statement, parameters) {
  let timeStamp = new Date();
  let formattedTimeStamp = timeStamp.toString().substring(4, 24);
  console.log(formattedTimeStamp, statement, parameters);
}

module.exports = async function dbQuery(statement, ...parameters) {
  let client = await new Client(CONNECTION);
  await client.connect();
  logQuery(statement, parameters);
  let result = await client.query(statement, parameters);
  await client.end()

  return result;
};