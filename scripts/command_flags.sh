# Help function
function show_help {
  echo "Usage: $0 [OPTIONS]"
  echo "Options:"
  echo "  --namespace=<NAMESPACE>   Set the namespace"
  echo "  --help                    Show this help message"
}

for arg in "$@"
do
  case $arg in
    --namespace=*)
    NAMESPACE="${arg#*=}"
    shift
    ;;
    --help)
    show_help
    exit 0
    ;;
  esac
done