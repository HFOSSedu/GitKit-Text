# The GitKit Activities

This repository contains the pretext source for the GitKit activites.

## Licensing 

Licensing information for the GitKit activites can be found in the [LICENSE.md](LICENSE.md) file.

## Document Structure

The files and folders in `source` include:
- `main.ptx` 
  - contains the outline for the whole book by importing other `.ptx` files.
- `ch-abc-def` folders
  - each chapter is contained in a folder
  - the file in the folder with the same name and the `.ptx` file is an outline of the chapter.
    - gives some introductory text and then includes the `.ptx` files for the sections of the chapter.
- `sec-ghi-jkl.ptx`
  - contains the markup and text for the setion, sub-sections, exercises, etc.

## Naming Conventions:

Every XML element that may need to be cross referenced using an `xref` must have an `xml:id` attribute.  In addition any elements that are recognized by Runestone must have a `label`.  For simplicity and consistency all of the elements identified below will have both an `xml:id` attribute and a `label` attribute with the same value.

For example, an `<exercises>` division following the naming convention defined below might have the `xml:id` and `label` as follows:
```
  <exercises 
    xml:id="ch-cc_sec-fc_exs-foss-community-principles"
    label="ch-cc_sec-fc_exs-foss-community-principles"
    > 
```

- Main Divisions:
  - `<chapter>`: `ch-abc-defg-hi` 
    - matches the filename containing the chapter
  - `<section>`: `ch-adh_sec-jk-lmn` 
    - `ch` with the first letter of each part of the chapter name
    - followed by an underscore
    - followed by the filename contaning the section
  - `<subsection>`: `ch-adh_ssec-opqr-stuv`
    - similar to above
    - text following `ssec` matches the title used for the section
    - note no indication of nesting in section for simplicity
  - `<subsubsection>`: `ch-adh_sssec-wx-yz`
    - similar to above
    - text following `sssec` matches the title used for the section
    - note no indication of nesting in section for simplicity

- Elements in Divisions:
  - `<figure>`: `ch-abh_sec-jl_fig-mop-qrs` 
    - `ch` as above
    - followed by an underscore
    - followed by containing division using its prefix (`sec`, `ws`, etc)
    - followed by an underscore
    - followed by `fig` and a unique idenifier within the file.
  - `<exercises>`: `ch-abh_ws_jl_exs-mnop-qrs`
    - similar to above.
  - `<exercise>`: `ch-abh_ws-jl_ex-mnop-qrs` 
    - similar to above
    - note no indication of nesting in `<exercises>` for simplicity.
  - `<task>`: `ch-abh_ws-jl_task_mnop-qrs` 
    - simialr to above
    - note no indication of nesting in `<exercise>` or `<exercises>`
