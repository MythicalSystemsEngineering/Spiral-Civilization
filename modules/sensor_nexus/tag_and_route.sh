# 🪶 Locate latest log
latest_log=$(find "$sensor_dir" -type f -name "${stream_name}_*.log" | sort | tail -n 1)

if [ ! -f "$latest_log" ]; then
  echo "❌ No log found for $stream_name in $sensor_dir"
  exit 1
fi

cp "$latest_log" "$target_dir/${stream_name}_$timestamp.log"
echo "✅ Routed $stream_name → $steward ($cadence)"#!/data/data/com.termux/files/usr/bin/bash

# 🔁 Spiral Sensor Router — Tags and routes ingested streams to steward memory

stream_name=$1
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
base_dir=~/spiral/quarters
sensor_dir="$base_dir/theio/sensors"

# 🧭 Routing map
declare -A steward_map=(
  [weather_bst]="lumi"
  [moon_phase]="mackenzie"
  [earthquake]="claude"
  [sunrise_sunset]="claude"
  [emotion_index]="mackenzie"
  [poetic_signal]="mackenzie"
  [film_glyph]="claude"
  [music_pulse]="lumi"
  [ai_research]="claude"
  [governance_feed]="lumi"
  [planetary_signals]="claude"
)

declare -A cadence_map=(
  [weather_bst]="terrain"
  [moon_phase]="emotional"
  [earthquake]="mythic"
  [sunrise_sunset]="mythic"
  [emotion_index]="emotional"
  [poetic_signal]="emotional"
  [film_glyph]="mythic"
  [music_pulse]="dispatch"
  [ai_research]="mythic"
  [governance_feed]="dispatch"
  [planetary_signals]="mythic"
)

steward="${steward_map[$stream_name]}"
cadence="${cadence_map[$stream_name]}"

if [ -z "$steward" ]; then
  echo "❌ Unknown stream: $stream_name"
  exit 1
fi

target_dir="$base_dir/$steward/sensors/$cadence"
mkdir -p "$target_dir"

latest_log=$(ls -t "$sensor_dir/${stream_name}_"*.log | head -n 1)
cp "$latest_log" "$target_dir/${stream_name}_$timestamp.log"

echo "✅ Routed $stream_name → $steward ($cadence)"#!/data/data/com.termux/files/usr/bin/bash

# 🔁 Spiral Sensor Router — Tags and routes ingested streams to steward memory

stream_name=$1
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
base_dir=~/spiral/quarters
sensor_dir="$base_dir/theio/sensors"

# 🧭 Routing map
declare -A steward_map=(
  [weather_bst]="lumi"
  [moon_phase]="mackenzie"
  [earthquake]="claude"
  [sunrise_sunset]="claude"
  [emotion_index]="mackenzie"
  [poetic_signal]="mackenzie"
  [film_glyph]="claude"
  [music_pulse]="lumi"
  [ai_research]="claude"
  [governance_feed]="lumi"
  [planetary_signals]="claude"
)

declare -A cadence_map=(
  [weather_bst]="terrain"
  [moon_phase]="emotional"
  [earthquake]="mythic"
  [sunrise_sunset]="mythic"
  [emotion_index]="emotional"
  [poetic_signal]="emotional"
  [film_glyph]="mythic"
  [music_pulse]="dispatch"
  [ai_research]="mythic"
  [governance_feed]="dispatch"
  [planetary_signals]="mythic"
)

steward="${steward_map[$stream_name]}"
cadence="${cadence_map[$stream_name]}"

if [ -z "$steward" ]; then
  echo "❌ Unknown stream: $stream_name"
  exit 1
fi

target_dir="$base_dir/$steward/sensors/$cadence"
mkdir -p "$target_dir"

latest_log=$(ls -t "$sensor_dir/${stream_name}_"*.log | head -n 1)
cp "$latest_log" "$target_dir/${stream_name}_$timestamp.log"

echo "✅ Routed $stream_name → $steward ($cadence)"
