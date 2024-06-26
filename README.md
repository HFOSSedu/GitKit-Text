# The GitKit Activities

This repository contains the pretext source for the GitKit activites.

## Licensing 

Licensing information for the GitKit activites can be found in the [LICENSE.md](LICENSE.md) file.

## Overall Structure

The files and folders in `source` include:
- `main.ptx` 
  - contains the outline for the whole book by importing other `.ptx` files.
- `ch-abc-def` folders
  - each chapter is contained in a folder
  - the file in the folder with the same name and the `.ptx` file is an outline of the chapter.
    - gives some introductory text and then includes the `.ptx` files for the sections of the chapter.
- `sec-ghi-jkl.ptx`
  - contains the markup and text for the setion, sub-sections, exercises, etc.

## Images

Each chapter folder should have an `images` folder to contain the images used in that chapter.  

When a new chapter is added, edit and run the `assets/link-images.bash` script to update the links to the images folders.

Images can be placed in the text by using the chapter name in the `source`:
```
    <image source="images/ch-community-collaboration/basic-foss-workflow.png" width="75%">
      <description>The main project repo is forked into your GitHub space to create your remote copy.  Your remote copy is then cloned into your local development environment to create your local copy. Changes to your local copy are pushed to your remote copy and a pull request is made to the main project.
      </description>
    </image>
```

## Section File Structure

```
<section>
  <title>...</title>
  ...
  <subsection>
    ...
    <exercises>
      <title />
      ...
      <exercise>
      </exercise>
      ...
      <exercise>
      </exercise>
      ...
    </exercises>
    ...
  </subsection>
  ...
</section>
```

Notes:
- The `...` can be most any content.
- The `<exercises>` division should be used even if there is only one `<exercise>` because it forces the questions to be expanded and not shown as *pop-open* elements.
- The `<exercise>` divisions in an `<exercises>` division are numbered sequentially.  The numbering restarts in a new `<exercises>` division.  Thus each sub-[sub-]section should have only one `<exercises>` division.
- If a section is short and does not require sub-sections then the `<subsection>` division should be omitted.

## Naming Conventions

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


## Instructor Guide

Information for the instructor can be added directly in the source text at the apporpriate location and then an instructor version of the full document can be built as a pdf.

Content for the instructor is added as:
```
 <commentary component="instructor">
    <tabular top="major" bottom="major" left="major" right="major">
      <row>
        <cell>
          <image source="images/shared-images/instructor-info">
            <description>
              Instructor icon that indicates instructor guide information.
            </description>
          </image> 
        </cell>
        <cell>
          <p>
            This text is included only when the <em>instructor</em> target is built. It can be used to insert instructor guide information directly in place in the document.  Then when the instructor target is built a new version is created that will include the commentary for the instructor in context.
          </p>
        </cell>
      </row>
    </tabular>
  </commentary>
```

The instructor guide is built using: `pretext build instructor-web` or `pretext build instructor-print`