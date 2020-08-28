SELECT 
  s.id,
  s.created_at,
  s.updated_at,
  s.total,
  s.status,
  st.name as sale_type,
  st.category,
  sd.currency,
  sd.country
  FROM sales as s
  INNER JOIN sale_details as sd ON sd.sale_id = s.id
  INNER JOIN sale_types as st ON st.id = s.sale_type_id