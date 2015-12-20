class ORCstock extends Stock
{
  ORCstock(String line)
  {
    String[] parts = line.split(",");
    
    date = parts[0];
    price = Float.parseFloat(parts[4]);
  }
}

