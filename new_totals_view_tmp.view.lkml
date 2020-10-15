view: new_totals_view_tmp {
  derived_table: {
    sql: WITH totals as(
      SELECT
            to_char(snapshot_date,'YYYY-MM') as month,
            count (distinct(id)) as total
            FROM dwh_bamboohr_employees_snapshot
            WHERE status = 'Active' AND job_title NOT IN ('Consultant', 'Non-Employee')
            Group by 1
      ),
      female as (
      SELECT
            to_char(snapshot_date,'YYYY-MM') as month,
            count (distinct(id)) as female
            FROM dwh_bamboohr_employees_snapshot
            WHERE status = 'Active' AND job_title NOT IN ('Consultant', 'Non-Employee') AND gender = 'Female'
            Group by 1
      ),
      male as (
      SELECT
            to_char(snapshot_date,'YYYY-MM') as month,
            count (distinct(id)) as male
            FROM dwh_bamboohr_employees_snapshot
            WHERE status = 'Active' AND job_title NOT IN ('Consultant', 'Non-Employee') AND gender = 'Male'
            Group by 1
      ),
      unreported as (
      SELECT
            to_char(snapshot_date,'YYYY-MM') as month,
            count (distinct(id)) as unreported
            FROM dwh_bamboohr_employees_snapshot
            WHERE status = 'Active' AND job_title NOT IN ('Consultant', 'Non-Employee') AND gender IS NULL
            Group by 1
      )
      SELECT
      t.month,
      t.total,
      f.female,
      m.male,
      u.unreported
      FROM totals t
      LEFT JOIN female f ON t.month = f.month
      LEFT JOIN male m ON f.month = m.month
      LEFT JOIN unreported u ON m.month = u.month
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  dimension: female {
    type: number
    sql: ${TABLE}.female ;;
  }

  dimension: male {
    type: number
    sql: ${TABLE}.male ;;
  }

  dimension: unreported {
    type: number
    sql: ${TABLE}.unreported ;;
  }

  set: detail {
    fields: [month, total, female, male, unreported]
  }
}
