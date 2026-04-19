import re, sys

hwh = open('fpga/vivado/proj_mnist_mlp/output/mlp.hwh', encoding='utf-8-sig').read()

# Vivado 2025 HWH is an XML. Find ADDRMAP entries.
# Pattern: <MEMRANGE INSTANCE="..." MASTERBUSINTERFACE="..." BASEVALUE="0x..." HIGHVALUE="0x..."/>
matches = re.findall(
    r'<MEMRANGE[^>]+INSTANCE="([^"]+)"[^>]+BASEVALUE="([^"]+)"[^>]*/?>',
    hwh, re.IGNORECASE
)
if matches:
    print("IP base addresses from MEMRANGE:")
    for name, addr in matches:
        if 'dma' in name.lower() or 'mlp' in name.lower():
            print(f"  {name}: {addr}")
else:
    # Try alternate: <RANGE ...>
    matches2 = re.findall(r'INSTANCE\s*=\s*"([^"]+)".*?BASEADDR.*?VALUE\s*=\s*"([^"]+)"', hwh, re.DOTALL|re.IGNORECASE)
    print("Alt search:", matches2[:10])

# Also scan for any hex addresses near dma/mlp_top names
print("\n--- Lines with DMA/MLP and address info ---")
for i, line in enumerate(hwh.split('\n')):
    lo = line.lower()
    if ('dma' in lo or 'mlp_top' in lo) and ('0x' in lo or 'addr' in lo or 'base' in lo):
        print(f"L{i}: {line.strip()[:200]}")
