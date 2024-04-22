import torch

PUBLIC_INITIAL_PEERS = [
    # IPv4 DNS addresses
    "/ip4/50.106.9.34/tcp/8888/p2p/12D3KooWLp756wZ5ifS8V3zPRxtDKATVRHd8i1Yzj1MtFkWUcXvk",
]

# The reachability API is currently used only when connecting to the public swarm
REACHABILITY_API_URL = "https://health.petals.dev"

DTYPE_MAP = dict(bfloat16=torch.bfloat16, float16=torch.float16, float32=torch.float32, auto="auto")
