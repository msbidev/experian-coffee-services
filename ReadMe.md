# Experian Coffee Services

## Deatails about the work uploaded onto Github: <Reference the path here>
### Source/Data
* SourceData folder contains the data used for loading that was extracted from https://database.coffeeinstitute.org/. 
### Source Code/Scripts 
* CoffeeQuality.dtsx is a Microsoft SSIS package developed to extract, transform and load the source data from coffee institute
* CoffeeQuality.dts.config is a configuration file that is used by CoffeeQuality.dtsx package
* Run_Package_Batch.txt is a batch file that has commands to run CoffeeQuality.dtsx package

### Database/Target

* DatabaseName: ExperianCoffee
* ExperianCoffeeServices_Schema_Script.sql contains the schema script to generate OLAP data model

## Environment setup

### Target Schema generation
* Create target database with DatabaseName as ExperianCoffee
* Run the file ExperianCoffeeServices_Schema_Script.sql to generate the required dimension and fact tables
### Package Configuration
* In the CoffeeQuality.dts.config file, update the ConnectionString value to match with the local SQL server(version 12 or above) having "Initial Catalog=ExperianCoffee"
* Update User::FilePath to reference to the path where the raw data exists
### Batch File
* Edit Run_Package_Batch.txt file, update the file paths refenereced to package and config files.
* Note: Please verify that the path to DTEXEC.exe to match with SQL Server with Integration Services installed instance and update the path accordingly
* Rename Run_Package_Batch.txt to Run_Package_Batch.bat
* Run the Run_Package_Batch.bat file and that triggers the data load