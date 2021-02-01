view: employee_compliance {
  derived_table: {
    sql: SELECT
      employee_name,
      work_email,
      hire_date,
      division,
      employee_number,
      department,
      job_title,
      status,
      anti_harassment_for_connecticut_residents_,
      security_awareness_training,
      anti_harassment_training,
      security_awareness_2020_onboarding,
      anti_harassment_for_california_residents_,
      anti_harassment_for_managers_of_new_york_residents_,
      code_of_conduct,
      anti_harassment_for_managers_of_california_residents_,
      security_policies,
      code_of_conduct_onboarding,
      anti_harassment_for_managers_,
      security_awareness_2020,
      anti_harassment_for_new_york_residents_,
      security_policies_onboarding,
      (CASE
          WHEN c.code_of_conduct_onboarding = 'Incomplete' THEN 'Incomplete'
          WHEN c.code_of_conduct_onboarding = 'Overdue' THEN 'Overdue'
          WHEN c.code_of_conduct_onboarding is null THEN 'N/A' ELSE 'Complete'
      END) AS code_of_conduct_onboarding_status,
      (CASE
          WHEN c.security_policies_onboarding = 'Incomplete' THEN 'Incomplete'
          WHEN c.security_policies_onboarding = 'Overdue' THEN 'Overdue'
          WHEN c.security_policies_onboarding is null THEN 'N/A' ELSE 'Complete'
      END) AS security_policies_onboarding_status,
      (CASE
          WHEN c.security_awareness_2020_onboarding = 'Incomplete' THEN 'Incomplete'
          WHEN c.security_awareness_2020_onboarding = 'Overdue' THEN 'Overdue'
          WHEN c.security_awareness_2020_onboarding is null THEN 'N/A' ELSE 'Complete'
      END) AS security_awareness_2020_onboarding_status,
      (CASE
          WHEN c.code_of_conduct = 'Incomplete' THEN 'Incomplete'
          WHEN c.code_of_conduct = 'Overdue' THEN 'Overdue'
          WHEN c.code_of_conduct is null THEN 'N/A' ELSE 'Complete'
      END) AS code_of_conduct_status,
      (CASE
          WHEN c.security_policies = 'Incomplete' THEN 'Incomplete'
          WHEN c.security_policies = 'Overdue' THEN 'Overdue'
          WHEN c.security_policies is null THEN 'N/A' ELSE 'Complete'
      END) AS security_policies_status,
      (CASE
          WHEN c.security_awareness_2020 = 'Incomplete' THEN 'Incomplete'
          WHEN c.security_awareness_2020 = 'Overdue' THEN 'Overdue'
          WHEN c.security_awareness_2020 is null THEN 'N/A' ELSE 'Complete'
      END) AS security_awareness_2020_status
      FROM google_sheets.people_compliance c
          LEFT JOIN google_sheets.people_compliance_bamboohr b
          ON c.employee_name = (concat(b.first_name,concat(' ', last_name)))
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: employee_name {
    type: string
    sql: ${TABLE}.employee_name ;;
  }

  dimension: work_email {
    type: string
    sql: ${TABLE}.work_email ;;
  }

  dimension: hire_date {
    type: date
    sql: ${TABLE}.hire_date ;;
    can_filter: yes
  }

  dimension: division {
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: employee_number {
    type: number
    sql: ${TABLE}.employee_number ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: job_title {
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: anti_harassment_for_connecticut_residents_ {
    type: number
    sql: ${TABLE}.anti_harassment_for_connecticut_residents_ ;;
  }

  dimension: security_awareness_training {
    type: number
    sql: ${TABLE}.security_awareness_training ;;
  }

  dimension: anti_harassment_training {
    type: string
    sql: ${TABLE}.anti_harassment_training ;;
  }

  dimension: security_awareness_2020_onboarding {
    type: string
    sql: ${TABLE}.security_awareness_2020_onboarding ;;
  }

  dimension: anti_harassment_for_california_residents_ {
    type: string
    sql: ${TABLE}.anti_harassment_for_california_residents_ ;;
  }

  dimension: anti_harassment_for_managers_of_new_york_residents_ {
    type: number
    sql: ${TABLE}.anti_harassment_for_managers_of_new_york_residents_ ;;
  }

  dimension: code_of_conduct {
    type: string
    sql: ${TABLE}.code_of_conduct ;;
  }

  dimension: anti_harassment_for_managers_of_california_residents_ {
    type: number
    sql: ${TABLE}.anti_harassment_for_managers_of_california_residents_ ;;
  }

  dimension: security_policies {
    type: string
    sql: ${TABLE}.security_policies ;;
  }

  dimension: code_of_conduct_onboarding {
    type: string
    sql: ${TABLE}.code_of_conduct_onboarding ;;
  }

  dimension: anti_harassment_for_managers_ {
    type: string
    sql: ${TABLE}.anti_harassment_for_managers_ ;;
  }

  dimension: security_awareness_2020 {
    type: string
    sql: ${TABLE}.security_awareness_2020 ;;
  }

  dimension: anti_harassment_for_new_york_residents_ {
    type: string
    sql: ${TABLE}.anti_harassment_for_new_york_residents_ ;;
  }

  dimension: security_policies_onboarding {
    type: string
    sql: ${TABLE}.security_policies_onboarding ;;
  }

  dimension: code_of_conduct_onboarding_status {
    type: string
    sql: ${TABLE}.code_of_conduct_onboarding_status ;;
  }

  dimension: security_policies_onboarding_status {
    type: string
    sql: ${TABLE}.security_policies_onboarding_status ;;
  }

  dimension: security_awareness_2020_onboarding_status {
    type: string
    sql: ${TABLE}.security_awareness_2020_onboarding_status ;;
  }

  dimension: code_of_conduct_status {
    type: string
    sql: ${TABLE}.code_of_conduct_status ;;
  }

  dimension: security_policies_status {
    type: string
    sql: ${TABLE}.security_policies_status ;;
  }

  dimension: security_awareness_2020_status {
    type: string
    sql: ${TABLE}.security_awareness_2020_status ;;
  }

  set: detail {
    fields: [
      employee_name,
      work_email,
      hire_date,
      division,
      employee_number,
      department,
      job_title,
      status,
      anti_harassment_for_connecticut_residents_,
      security_awareness_training,
      anti_harassment_training,
      security_awareness_2020_onboarding,
      anti_harassment_for_california_residents_,
      anti_harassment_for_managers_of_new_york_residents_,
      code_of_conduct,
      anti_harassment_for_managers_of_california_residents_,
      security_policies,
      code_of_conduct_onboarding,
      anti_harassment_for_managers_,
      security_awareness_2020,
      anti_harassment_for_new_york_residents_,
      security_policies_onboarding,
      code_of_conduct_onboarding_status,
      security_policies_onboarding_status,
      security_awareness_2020_onboarding_status,
      code_of_conduct_status,
      security_policies_status,
      security_awareness_2020_status
    ]
  }
}
