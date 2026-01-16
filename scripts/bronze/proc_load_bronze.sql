/*
===================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===================================================================================

Script Purpose:
    This stored procedure loads raw data into the Bronze schema
    from external CSV files (file-based ingestion).

    It Performs the following actions:
    - Truncates the bronze tables before loading data.
    - Use the Postgres COPY command to load data from the CSV files.
    - Measures load time per table.
    - Measures total batch execution time.
-----------------------------------------------------------------------------------
Parameters:
-----------------------------------------------------------------------------------
    None.
    This stored procedure does not accept any parameters or return any values.
-----------------------------------------------------------------------------------
How to Execute:
-----------------------------------------------------------------------------------
    CALL bronze.load_bronze();

===================================================================================

*/
CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $BODY$
DECLARE
    rows_count        BIGINT;
    start_time        TIMESTAMP;
    end_time          TIMESTAMP;
    interval_diff     INTERVAL;
    hours             INT;
    minutes           INT;
    seconds           INT;
    milliseconds      INT;
    batch_start_time  TIMESTAMP;
    batch_end_time    TIMESTAMP;
BEGIN
    batch_start_time := NOW();

    RAISE NOTICE '==================================================';
    RAISE NOTICE 'LOADING BRONZE LAYER';
    RAISE NOTICE '==================================================';
    RAISE NOTICE '';

    
	 
    RAISE NOTICE '---------------------------------------------------';
    RAISE NOTICE 'Loading CRM Tables';
    RAISE NOTICE '---------------------------------------------------';
    RAISE NOTICE '';
	 


    -- --------------------- CRM cust_info ---------------------
    start_time := NOW();
    TRUNCATE TABLE bronze.crm_cust_info;
    COPY bronze.crm_cust_info
    FROM 'C:\sql\dwh_project\datasets\source_crm\cust_info.csv'
    WITH (FORMAT csv,
           HEADER true,
	      DELIMITER ','
	     );
    SELECT COUNT(*) INTO rows_count FROM bronze.crm_cust_info;
    RAISE NOTICE 'crm_cust_info: % rows loaded', rows_count;

    end_time := NOW();
    interval_diff := end_time - start_time;
    hours := EXTRACT(HOUR FROM interval_diff)::INT;
    minutes := EXTRACT(MINUTE FROM interval_diff)::INT;
    seconds := EXTRACT(SECOND FROM interval_diff)::INT;
    milliseconds := ROUND(EXTRACT(MILLISECOND FROM interval_diff))::INT;
    RAISE NOTICE 'Load Duration: % hours, % minutes, % seconds, % milliseconds', hours, minutes, seconds, milliseconds;
    RAISE NOTICE '';

    -- --------------------- CRM prd_info ---------------------
    start_time := NOW();
    TRUNCATE TABLE bronze.crm_prd_info;
    COPY bronze.crm_prd_info
    FROM 'C:\sql\dwh_project\datasets\source_crm\prd_info.csv'
    WITH (FORMAT csv,
           HEADER true,
	      DELIMITER ','
	     );
    SELECT COUNT(*) INTO rows_count FROM bronze.crm_prd_info;
    RAISE NOTICE 'crm_prd_info: % rows loaded', rows_count;

    end_time := NOW();
    interval_diff := end_time - start_time;
    hours := EXTRACT(HOUR FROM interval_diff)::INT;
    minutes := EXTRACT(MINUTE FROM interval_diff)::INT;
    seconds := EXTRACT(SECOND FROM interval_diff)::INT;
    milliseconds := ROUND(EXTRACT(MILLISECOND FROM interval_diff))::INT;
    RAISE NOTICE 'Load Duration: % hours, % minutes, % seconds, % milliseconds', hours, minutes, seconds, milliseconds;
    RAISE NOTICE '';

    -- --------------------- CRM sales_details ----------------------
    start_time := NOW();
    -- Truncate the Table & then Import the csv file
    TRUNCATE TABLE bronze.crm_sales_details;
    COPY bronze.crm_sales_details
    FROM 'C:\sql\dwh_project\datasets\source_crm\sales_details.csv'
    WITH (FORMAT csv,
           HEADER true,
	      DELIMITER ','
	     );
    SELECT COUNT (*) INTO rows_count FROM bronze.crm_sales_details;
    RAISE NOTICE 'crm_sales_details: % rows loaded', rows_count;

    end_time := NOW();
    interval_diff := end_time - start_time;
    hours := EXTRACT(HOUR FROM interval_diff)::INT;
    minutes := EXTRACT(MINUTE FROM interval_diff)::INT;
    seconds := EXTRACT(SECOND FROM interval_diff)::INT;
    milliseconds := ROUND(EXTRACT(MILLISECOND FROM interval_diff))::INT;
    RAISE NOTICE 'Load Duration: % hours, % minutes, % seconds, % milliseconds', hours, minutes, seconds, milliseconds;
    RAISE NOTICE '';


	 RAISE NOTICE '---------------------------------------------------';
	 RAISE NOTICE 'Loading ERP Tables';
	 RAISE NOTICE '---------------------------------------------------';
	 RAISE NOTICE '';
	 
    
    -- --------------------- ERP cust_az12 ---------------------
    start_time := NOW();
    TRUNCATE TABLE bronze.erp_cust_az12;
    COPY bronze.erp_cust_az12
    FROM 'C:\sql\dwh_project\datasets\source_erp\CUST_AZ12.csv'
    WITH (FORMAT csv,
           HEADER true,
	      DELIMITER ','
	     );
    SELECT COUNT(*) INTO rows_count FROM bronze.erp_cust_az12;
    RAISE NOTICE 'erp_cust_az12: % rows loaded', rows_count;

    end_time := NOW();
    interval_diff := end_time - start_time;
    hours := EXTRACT(HOUR FROM interval_diff)::INT;
    minutes := EXTRACT(MINUTE FROM interval_diff)::INT;
    seconds := EXTRACT(SECOND FROM interval_diff)::INT;
    milliseconds := ROUND(EXTRACT(MILLISECOND FROM interval_diff))::INT;
    RAISE NOTICE 'Load Duration: % hours, % minutes, % seconds, % milliseconds', hours, minutes, seconds, milliseconds;
    RAISE NOTICE '';

    -- --------------------- ERP loc_a101 ----------------------
    start_time := NOW();
    -- Truncate the Table & then Import the csv file
    TRUNCATE TABLE bronze.erp_loc_a101;
    COPY bronze.erp_loc_a101
    FROM 'C:\sql\dwh_project\datasets\source_erp\LOC_A101.csv'
    WITH (FORMAT csv,
           HEADER true,
	      DELIMITER ','
	     );
    SELECT COUNT (*) INTO rows_count FROM bronze.erp_loc_a101;
    RAISE NOTICE 'erp_loc_a101: % rows loaded', rows_count;

    end_time := NOW();
    interval_diff := end_time - start_time;
    hours := EXTRACT(HOUR FROM interval_diff)::INT;
    minutes := EXTRACT(MINUTE FROM interval_diff)::INT;
    seconds := EXTRACT(SECOND FROM interval_diff)::INT;
    milliseconds := ROUND(EXTRACT(MILLISECOND FROM interval_diff))::INT;
    RAISE NOTICE 'Load Duration: % hours, % minutes, % seconds, % milliseconds', hours, minutes, seconds, milliseconds;
    RAISE NOTICE '';

    -- --------------------- ERP px_cat_g1v2 ----------------------
    start_time := NOW();
    -- Truncate the Table & then Import the csv file
    TRUNCATE TABLE bronze.erp_px_cat_g1v2;
    COPY bronze.erp_px_cat_g1v2
    FROM 'C:\sql\dwh_project\datasets\source_erp\PX_CAT_G1V2.csv'
    WITH (FORMAT csv,
           HEADER true,
	      DELIMITER ','
	     );
    SELECT COUNT (*) INTO rows_count FROM bronze.erp_px_cat_g1v2;
    RAISE NOTICE 'erp_px_cat_g1v2: % rows loaded', rows_count;

    end_time := NOW();
    interval_diff := end_time - start_time;
    hours := EXTRACT(HOUR FROM interval_diff)::INT;
    minutes := EXTRACT(MINUTE FROM interval_diff)::INT;
    seconds := EXTRACT(SECOND FROM interval_diff)::INT;
    milliseconds := ROUND(EXTRACT(MILLISECOND FROM interval_diff))::INT;
    RAISE NOTICE 'Load Duration: % hours, % minutes, % seconds, % milliseconds', hours, minutes, seconds, milliseconds;



     batch_end_time := NOW();
    interval_diff := batch_end_time - batch_start_time;
    hours := EXTRACT(HOUR FROM interval_diff)::INT;
    minutes := EXTRACT(MINUTE FROM interval_diff)::INT;
    seconds := EXTRACT(SECOND FROM interval_diff)::INT;
    milliseconds := ROUND(EXTRACT(MILLISECOND FROM interval_diff))::INT;
    RAISE NOTICE '===================================================';
    RAISE NOTICE 'Bronze Layer Loading Completed in % hours, % minutes, % seconds, % milliseconds',
                 hours, minutes, seconds, milliseconds;
    RAISE NOTICE '===================================================';

---------Error handling Logic
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE '----------------------------------------------------';
        RAISE NOTICE '---- ERROR OCCURRED DURING LOADING BRONZE LAYER -----';
        RAISE NOTICE 'Error Message: %', SQLERRM;
        RAISE NOTICE 'Error Code: %', SQLSTATE;
        RAISE NOTICE 'Error Detail: %', COALESCE(PG_EXCEPTION_DETAIL, 'N/A');
        RAISE NOTICE 'Error Hint: %', COALESCE(PG_EXCEPTION_HINT, 'N/A');
        RAISE NOTICE '----------------------------------------------------';
        RAISE NOTICE '';
END;
$BODY$;
