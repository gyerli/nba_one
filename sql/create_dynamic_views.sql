SELECT 'CREATE OR REPLACE VIEW lnd.vw_' || t.table_name || ' AS SELECT * FROM (SELECT ' ||
ARRAY_TO_STRING(ARRAY(
	SELECT COLUMN_NAME::VARCHAR(50)
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME=t.table_name
	  AND TABLE_SCHEMA='lnd'
	ORDER BY ORDINAL_POSITION
), ', ') || ', ROW_NUMBER() OVER (PARTITION BY ' || p.pk || ' ORDER BY CREATED_AT DESC) as RN ' || 'FROM lnd.' || t.table_name 
|| ') as t WHERE t.rn = 1;'
from information_schema.tables t
inner join meta.table_pk p on t.table_name = p.table_name
where table_schema = 'lnd'
--and t.table_name = 'teams'
