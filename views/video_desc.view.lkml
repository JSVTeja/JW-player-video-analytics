view: video_desc {
  sql_table_name: `apnews-dataplatform.video_engagement.jw_player_content` ;;

  dimension_group: created {
    type: time
    timeframes: [date, week, month]
    datatype: datetime
    sql: ${TABLE}.created ;;
  }

  dimension: duration {
    sql:  ${TABLE}.duration ;;
    type: number
  }
  dimension: duration_bins {
    case: {
      when: {
        sql: round(${duration}) < 30 ;;
        label: "Short"
      }
      when: {
        sql: round(${duration}) >=30 AND round(${duration}) <=60 ;;
        label: "Medium"
      }
      when: {
        sql: round(${duration}) > 60 ;;
        label: "Long"
      }
    }
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
  measure: num_of_videos {
    type:  count
    drill_fields: [category,duration_bins,num_of_videos]
    }
  measure: avg_video_duration {
    type: average
    sql: ${TABLE}.duration ;;
  }
}
