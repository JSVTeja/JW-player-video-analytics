view: video_desc {
  sql_table_name: `apnews-dataplatform.video_engagement.jw_player_content` ;;

  dimension: created {
    sql:  ${TABLE}.created ;;
    type: date

  }
  dimension: duration {
    sql:  ${TABLE}.duration ;;
    type: number
  }
  dimension: external_id {
    sql:  ${TABLE}.external_id ;;
  }
  dimension: id {
    sql:  ${TABLE}.id ;;
    primary_key: yes

  }
  dimension: author {
    sql:  ${TABLE}.author ;;

  }
  dimension: category {
    sql:  ${TABLE}.category ;;
  }
  dimension: description {
    sql:  ${TABLE}.description ;;

  }
  dimension: language {
    sql:  ${TABLE}.language ;;

  }
  dimension: permalink {
    sql:  ${TABLE}.permalink ;;

  }
  dimension: publish_start_date {
    sql:  ${TABLE}.start_date ;;
    type:  date
  }
  dimension: title {
    sql:  ${TABLE}.title ;;
  }
  measure: total_duration {
    type:  sum
    sql: ${TABLE}.duration ;;
    }
    }
