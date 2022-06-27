# Issue-ID Collector

## Description

This GitHub action goes through every commit between the last two Tags created and collects every Issue-ID/Ticket-ID (e.g. `PAC-123`, `LOL-321`, `ABCD-000`) and filters them to only contain unique IDs. 
It produces the resulting List of IDs as an output together with the current Tags name.

## Usage

In your github-workflow, include the following step:

```yaml
- name: Fetch Ticket Ids
  id: fetchTicketIds
  uses: Staffbase/github-action-issue-id-collection@master
  env:
    TAG_MATCHER: v*-web (default '.*')
```

## Outputs:

- `tIDs`: List of Ticket-IDs, seperated by comma
- `tagName`: Name of the current Tag

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## License

This project is licensed under the Apache-2.0 License - see the [LICENSE.md](LICENSE) file for details.


<table>
  <tr>
    <td>
      <img src="docs/assets/images/staffbase.png" alt="Staffbase GmbH" width="96" />
    </td>
    <td>
      <b>Staffbase GmbH</b>
      <br />Staffbase is an internal communications platform built to revolutionize the way you work and unite your company. Staffbase is hiring: <a href="https://jobs.staffbase.com" target="_blank" rel="noreferrer">jobs.staffbase.com</a>
      <br /><a href="https://github.com/Staffbase" target="_blank" rel="noreferrer">GitHub</a> | <a href="https://staffbase.com/" target="_blank" rel="noreferrer">Website</a> | <a href="https://jobs.staffbase.com" target="_blank" rel="noreferrer">Jobs</a>
    </td>
  </tr>
</table>
