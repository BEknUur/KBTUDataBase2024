-- 1
CREATE OR REPLACE FUNCTION increase_value(input_value INTEGER)
RETURNS INTEGER AS $$
BEGIN
    RETURN input_value + 10;
END;
$$ LANGUAGE plpgsql;

--2
CREATE OR REPLACE FUNCTION compare_numbers(num1 INTEGER, num2 INTEGER)
RETURNS TEXT AS $$
DECLARE
    result TEXT;
BEGIN
    IF num1 > num2 THEN
        result := 'Greater';
    ELSIF num1 = num2 THEN
        result := 'Equal';
    ELSE
        result := 'Lesser';
    END IF;
    RETURN result;
END;
$$ LANGUAGE plpgsql;

--3
CREATE OR REPLACE FUNCTION number_series(n INTEGER)
RETURNS TABLE(series INTEGER) AS $$
BEGIN
    FOR series IN 1..n LOOP
        RETURN NEXT series;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

--4
CREATE OR REPLACE FUNCTION find_employee(employee_name VARCHAR)
RETURNS TABLE(id INTEGER, name VARCHAR, position VARCHAR, salary NUMERIC) AS $$
BEGIN
    RETURN QUERY SELECT * FROM employees WHERE name = employee_name;
END;
$$ LANGUAGE plpgsql;

--5
CREATE OR REPLACE FUNCTION list_products(category_name VARCHAR)
RETURNS TABLE(product_id INTEGER, product_name VARCHAR, price NUMERIC, category VARCHAR) AS $$
BEGIN
    RETURN QUERY SELECT id, name, price, category FROM products WHERE category = category_name;
END;
$$ LANGUAGE plpgsql;

--6
CREATE OR REPLACE FUNCTION calculate_bonus(salary NUMERIC)
RETURNS NUMERIC AS $$
BEGIN
    RETURN salary * 0.10; -- Assuming 10% bonus
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_salary(employee_id INTEGER)
RETURNS VOID AS $$
DECLARE
    current_salary NUMERIC;
    bonus NUMERIC;
BEGIN
    SELECT salary INTO current_salary FROM employees WHERE id = employee_id;
    bonus := calculate_bonus(current_salary);
    UPDATE employees SET salary = current_salary + bonus WHERE id = employee_id;
END;
$$ LANGUAGE plpgsql;

--7
CREATE OR REPLACE FUNCTION complex_calculation(num_value INTEGER, str_value VARCHAR)
RETURNS TEXT AS $$
DECLARE
    numeric_result INTEGER;
    string_result VARCHAR;
BEGIN
    -- Subblock 1: Numeric Computation
    <<numeric_block>>
    BEGIN
        numeric_result := num_value * 2; -- Example numeric operation
    END numeric_block;

    -- Subblock 2: String Manipulation
    <<string_block>>
    BEGIN
        string_result := UPPER(str_value) || '!';
    END string_block;

    -- Combine results
    RETURN 'Numeric: ' || numeric_result || ', String: ' || string_result;
END;
$$ LANGUAGE plpgsql;
