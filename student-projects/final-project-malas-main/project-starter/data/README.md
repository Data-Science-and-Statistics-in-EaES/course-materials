# data

Place data file(s) in this folder.

Then, include codebooks (variables, and their descriptions) for your data file(s)
using the following format.

## Full_16s_df 

- `OTU`:            <chr> Operational Taxonomic Units (OTUs) binned together based on sequences
- `Sample`:         <chr> The name of the sample 
- `Abundance`:      <dbl> Relative abundance of the OTU in each sample
- `sample`:         <fct> Blank unused column 
- `bottle`:         <chr> The individual microcosm names
- `bottle_number`  <chr> The name of the microcosm combined with the time point of the DNA sample
- `sample_time`    <chr> The time-point that the DNA was sampled (i.e. time 1, time 2, etc.)
- `spike`          <chr> The chemical disruption "spike" added to the microcosm after 40 days (or control                           if no disruption added)
- `spike_time`     <chr> The spike added combined with the timepoint of sampling
- `days`           <int> The number of days passed since the start of the experiment when a sample                           was taken. 
- `Fe.2.mg_L`      <dbl> Concentration of Fe 2+ in mg/L in the microcosm leachate
- `Fe.3.mg_L`      <dbl> Concentration of Fe 3+ in mg/L in the microcosm leachate
- `Fe_total.Mg_L`  <dbl> Concentration of total iron in mg/L in the microcosm leachate
- `sulfide..ug.L.` <chr>  Concentration of sulfide in microgram/L in the microcosm leachate
- `Kingdom`        <chr>  Kingdom that the OTU was assigned to 
- `Phylum`        <chr> Phylum that the OTU was assigned to 
- `Class`          <chr> Class that the OTU was assigned to 
- `Order`          <chr> Order that the OTU was assigned to 
- `Family`         <chr> Family that the OTU was assigned to 
- `Genus`          <chr> Genus that the OTU was assigned to 


