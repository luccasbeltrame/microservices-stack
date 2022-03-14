echo "Download Linkerd" 
curl --proto '=https' --tlsv1.2 -sSfL https://run.linkerd.io/install | sh
export PATH=$PATH:$HOME/.linkerd2/bin

echo "Check Version"
linkerd version

echo "Check Requisites"
linkerd check --pre

echo "Install Linkerd"
linkerd install | kubectl apply -f -

echo "Install Dashboard"
linkerd viz install | kubectl apply -f -

echo "Sidecar Inject Namespace Default"
kubectl get deploy -o yaml | linkerd inject - | kubectl apply -f - 