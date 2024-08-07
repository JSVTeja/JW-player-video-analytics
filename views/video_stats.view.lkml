view: video_stats {
  sql_table_name: `apnews-dataplatform.video_engagement.jw_player_engagement_by_media` ;;

  dimension_group: date {
    type: time
    timeframes: [date, week, month]
    datatype: datetime
    sql: ${TABLE}.date ;;
  }
  dimension: platform {
    sql: ${TABLE}.platform ;;
  }
  dimension: media_id {
    sql: ${TABLE}.media_id ;;

  }
  dimension: embeds {
    sql: ${TABLE}.embeds ;;
    type: number
  }
  dimension: plays {
    sql: ${TABLE}.plays ;;
    type: number
  }
  dimension: completes {
    sql: ${TABLE}.completes ;;
    type: number
  }
  dimension: ingested_at {
    sql: ${TABLE}.ingested_at ;;
    type: date_time
  }

  measure: aggregate_completion_rate {
    type: number
    sql: CASE WHEN ${total_plays} > 0 THEN (${total_completes} / ${total_plays})*100 ELSE 0 END ;;
  }

  measure: avg_plays_per_video_by_category {
    type: number
    sql: ${total_plays} / COUNT(DISTINCT ${video_desc.id});;
  }

  measure: total_embeds {
    type:  sum
    sql: ${embeds} ;;
  }

  measure: total_plays {
    type:  sum
    sql: ${plays} ;;
  }

  measure: total_completes {
    type:  sum
    sql: ${completes} ;;
  }
  }
