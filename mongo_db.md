# Mongo DB


## Notes
* Connect to Mongo Database
    * `mongo --host mdb1.dev-core.werally.in -u robocopunicorn -p 'EeX|eeghei1bich3' sortinghat --ssl --sslAllowInvalidCertificates`
* Set Slave
  * First thing you need to do is enable querying on slave Mongo node by using either `db.getMongo().setSlaveOk()`
* Set Database
  * Switch to database using - `use sortinghat`
* List Collections
  * Use `show collections` to list available collections in database
* List indexes on a collection
  * `db.ssoVendorConfig.getIndexes()`
* Sample query
  * **FIRST** make sure that your query would do an index scan (`IXSCAN`) and NOT collection scan (`COLLSCAN`) by using `explain()` -  `db.ssoVendorConfig.find({"vendorId": "WELLNESS_INC"}).explain()`
  * Look for `IXSCAN` value as part of `winningPlan`, for e.g.
  ```json
  "winningPlan" : {
    "stage" : "FETCH",
    "inputStage" : {
      "stage" : "IXSCAN",
      "keyPattern" : {
        "vendorId" : 1
      },
      "indexName" : "vendorId_1",
  ```
  * Once you've verified that your query would run index scan then execute the query (minus `explain()`), you can add `pretty()` to format returned JSON.


### Common Queries
| Query | Description |
| --- | --- |
| `use sortinghat` | Switches to named database |
| `show collections` | Lists all available collections in current databse |
| `db.collectionName.findOne()` | Returns a single record from collection |
| `db.collectionName.find({"attribute": "searchValue"})` | Similar to SQL WHERE clause |
| `db.collectionName.find({"attribute": "searchValue"}).limit(1)` | Similar to SQL TOP clause, specify maximum number of documents to be returned |
| `db.collectionName.find({"attribute": "searchValue"}).pretty()` | Pretty formats JSON |
| `db.collectionName.find({"attribute": "searchValue"}).explain()` | Shows query execution plan, look for `"winningPlan"` and `IXSCAN`. There should not be a collection scan (`COLLSCAN`) as that could bring database down |
| `db.collectionName.find({"collectionAttribute": "searchValue"}).sort({"attribute": 1})` | Sorts returned documents in ascending order of the specified attribute value. Use `-1` for descending sort. |
| `db.collectionName.getIndexes()` | List indexes on a collection |
