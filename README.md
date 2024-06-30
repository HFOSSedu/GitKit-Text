# The GitKit Activities

This repository contains the pretext source for the GitKit activities.

## Licensing

Licensing information for the GitKit activities can be found in the [LICENSE.md](LICENSE.md) file.

## Contributing

1. Fork the upstream repo.
2. Open your fork in a Codespace using the green "Code" button.
3. Run `assets/link-images.bash`
4. Edit and commit chagnes to a feature branch.
5. Push and make a Pull Request

## Overall Structure

The files and folders in `source` include:

- `main.ptx`
  - contains the outline for the whole book by importing other `.ptx` files.
- `ch-abc-def` folders
  - each chapter is contained in a folder
  - the file in the folder with the same name and the `.ptx` file is an outline of the chapter.
    - gives some introductory text and then includes the `.ptx` files for the sections of the chapter.
- `sec-ghi-jkl.ptx`
  - contains the markup and text for the section, sub-sections, exercises, etc.

## Images

Each chapter folder should have an `images` folder to contain the images used in that chapter.

When a new chapter is added, edit and run the `assets/link-images.bash` script to update the links to the images folders.

Images can be placed in the text by using the chapter name in the `source`:

```xml
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
- The `<exercises>` division should be used even if there is only one `<exercise>` because it forces the questions to be expanded and not shown as _pop-open_ elements.
- The `<exercise>` divisions in an `<exercises>` division are numbered sequentially. The numbering restarts in a new `<exercises>` division. Thus each sub-[sub-]section should have only one `<exercises>` division.
- If a section is short and does not require sub-sections then the `<subsection>` division should be omitted.

## Naming Conventions

Every XML element that may need to be cross referenced using an `xref` must have an `xml:id` attribute. In addition any elements that are recognized by Runestone must have a `label`. For simplicity and consistency all of the elements identified below will have both an `xml:id` attribute and a `label` attribute with the same value.

For example, an `<exercises>` division following the naming convention defined below might have the `xml:id` and `label` as follows:

```xml
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
    - followed by `fig` and a unique identifier within the file.
  - `<exercises>`: `ch-abh_ws_jl_exs-mnop-qrs`
    - similar to above.
  - `<exercise>`: `ch-abh_ws-jl_ex-mnop-qrs`
    - similar to above
    - note no indication of nesting in `<exercises>` for simplicity.
  - `<task>`: `ch-abh_ws-jl_task_mnop-qrs`
    - similar to above
    - note no indication of nesting in `<exercise>` or `<exercises>`

## Versions

The `<target>`s defined in the `project.ptx` file define the different versions of the book that can be built. How each version appears in defined by the `.ptx` files in the `publication` folder that are referenced by the `<target>`

There are six versions defined at the moment:

- `student-web` and `student-print` - The book as students will see it.
- `instructor-web` and `instructor-print` - The book including notes to the instructor (see below).
- `web` and `print` - same as the instructor versions. Included for the CodeChat preview.

The versions can be built using the `PreTeXt` menu or using terminal commands similar to:

```text
pretext build instructor-web
pretext view instructor-web
```

### Adding Comments to the Instructor Versions

Information for the instructor can be added directly in the source text at the appropriate location and then an instructor version of the full document can be built.

Content for the instructor is added as:

```xml
 <commentary component="instructor">
    <tabular top="major" bottom="major" left="major" right="major">
      <col width="100%" />
      <row>
        <cell>
          <p>
            <alert>Instructor Note:</alert>: Information for the instructor appears here.
          </p>
        </cell>
      </row>
    </tabular>
  </commentary>
```
