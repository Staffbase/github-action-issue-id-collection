# Issue-ID collector

## Description

This Github action goes through every commit between the last two Tags created and collects every Issue-ID/ Ticket-ID (e.g. `PAC-123`, `LOL-321`, `ABCD-000`) and filters them to only contain unique IDs. It produces the resulting List of IDs as an output together with the current Tags name.

---

## Usage

In your github-workflow, include the following step:

```yaml
- name: fetchTicketIds
    id: fetchTicketIds
    uses: Staffbase/github-action-issue-id-collection@master
    env:
      TAG_MATCHER: v*-web (default '.*')
```

---

## Outputs:

-   `tIDs`: List of Ticket-IDs, seperated by comma
-   `tagName`: Name of the current Tag
