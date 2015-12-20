class APLstock extends Stock
{  
  APLstock(String line)
  {
    String[] parts = line.split(",");

    date = parts[0];
    price = Float.parseFloat(parts[4]);
  }
}

