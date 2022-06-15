· · · · ·

IP Options parsing stack overflow
(CVE-2019-12256)

TCP Urgent Pointer TCP AO state confusion
(CVE-2019-12255)

TCP Urgent Pointer 0 integer underflow
(CVE-2019-12255)

TCP Urgent Pointer race condition
(CVE-2019-12263)

Reverse ARP logical flaw
(CVE-2019-12262)

TCP connection DoS via malformed options
(CVE-2019-12258)

IGMP Information leak
(CVE-2019-12265)

DHCP response heap overflow
(CVE-2019-12257)

DHCP client IPv4 assignment logical flaw
(CVE-2019-12264)

IGMP NULL dereference
(CVE-2019-12259)

TCP Urgent Pointer connect-back state confusion
(CVE-2019-12261)

IP Options parsing stack overflow (CVE-2019-12256)

TCP Urgent Pointer TCP AO state confusion
(CVE-2019-12255)

TCP Urgent Pointer 0 integer underflow
(CVE-2019-12255)

TCP Urgent Pointer race condition
(CVE-2019-12263)

Reverse ARP logical flaw
(CVE-2019-12262)

TCP connection DoS via malformed options
(CVE-2019-12258)

IGMP Information leak
(CVE-2019-12265)

DHCP response heap overflow
(CVE-2019-12257)

DHCP client IPv4 assignment logical flaw
(CVE-2019-12264)

IGMP NULL dereference
(CVE-2019-12259)

TCP Urgent Pointer connect-back state confusion
(CVE-2019-12261)

Packet

Packet

Packet

Packet

Destination Unreachable Param Problem
Echo Response

while ( 1 ) { current_opt = ipnet_ip4_get_ip_opt_next(current_opt, copyopts_param->options_ptr, copyopts_param->total_opt_size); ... opt_type = *current_opt; if ( opt_type == IP_IPOPT_SSRR ) { srr_opt = (srr_opt_t *)&opts->opts[opts->len]; // Doesn't validate this offset is within the current option offset_to_current_route_entry = srr_opt->ptr - 5; ... current_route_entry = &current_opt[offset_to_current_route_entry]; while ( offset_to_current_route_entry > 0 ) { memcpy((char *)srr_opt + srr_opt->length, current_route_entry, 4); current_route_entry -= 4; offset_to_current_route_entry -= 4; srr_opt->length += 4; }
}

IP Options parsing stack overflow
(CVE-2019-12256)

TCP Urgent Pointer TCP AO state confusion
(CVE-2019-12255)

TCP Urgent Pointer 0 integer underflow
(CVE-2019-12255)

TCP Urgent Pointer race condition
(CVE-2019-12263)

Reverse ARP logical flaw
(CVE-2019-12262)

TCP connection DoS via malformed options
(CVE-2019-12258)

IGMP Information leak
(CVE-2019-12265)

DHCP response heap overflow
(CVE-2019-12257)

DHCP client IPv4 assignment logical flaw
(CVE-2019-12264)

IGMP NULL dereference
(CVE-2019-12259)

TCP Urgent Pointer connect-back state confusion
(CVE-2019-12261)

IP Options parsing stack overflow
(CVE-2019-12256)

TCP Urgent Pointer TCP AO state confusion
(CVE-2019-12255)

TCP Urgent Pointer 0 integer underflow
(CVE-2019-12255)

TCP Urgent Pointer race condition
(CVE-2019-12263)

Reverse ARP logical flaw (CVE-2019-12262)

TCP connection DoS via malformed options
(CVE-2019-12258)

IGMP Information leak
(CVE-2019-12265)

DHCP response heap overflow
(CVE-2019-12257)

DHCP client IPv4 assignment logical flaw
(CVE-2019-12264)

IGMP NULL dereference
(CVE-2019-12259)

TCP Urgent Pointer connect-back state confusion
(CVE-2019-12261)

... if ( *(_WORD *)rarp_pkt == 256
&& *(_WORD *)(rarp_pkt + 2) == 8 && *(_BYTE *)(rarp_pkt + 4) == 6 && *(_BYTE *)(rarp_pkt + 5) == 4 && *(_WORD *)(rarp_pkt + 6) == 1024 ) { interface = ipnet_eth_is_valid_node_mac(interface, rarp_pkt + 8); if ( interface ) {
// Validate the IP address isn't class D or E if ( !(*(_WORD *)(rarp_pkt + 24) & 0x80)
|| (*(_WORD *)(rarp_pkt + 24) & 0xC0) == 128 || (interface = *(_WORD *)(rarp_pkt + 24) & 0xE0, interface == 192) ) { ret = ipnet_ip4_add_addr(interface); ...

IP Options parsing stack overflow
(CVE-2019-12256)

TCP Urgent Pointer TCP AO state confusion
(CVE-2019-12255)

TCP Urgent Pointer 0 integer underflow
(CVE-2019-12255)

TCP Urgent Pointer race condition
(CVE-2019-12263)

Reverse ARP logical flaw
(CVE-2019-12262)

TCP connection DoS via malformed options
(CVE-2019-12258)

IGMP Information leak
(CVE-2019-12265)

DHCP response heap overflow
(CVE-2019-12257)

DHCP client IPv4 assignment logical flaw
(CVE-2019-12264)

IGMP NULL dereference
(CVE-2019-12259)

TCP Urgent Pointer connect-back state confusion
(CVE-2019-12261)

IP Options parsing stack overflow
(CVE-2019-12256)

TCP Urgent Pointer TCP AO state confusion (CVE-2019-12255)

TCP Urgent Pointer 0 integer underflow (CVE-2019-12255)

TCP Urgent Pointer race condition
(CVE-2019-12263)

Reverse ARP logical flaw
(CVE-2019-12262)

TCP connection DoS via malformed options
(CVE-2019-12258)

IGMP Information leak
(CVE-2019-12265)

DHCP response heap overflow
(CVE-2019-12257)

DHCP client IPv4 assignment logical flaw
(CVE-2019-12264)

IGMP NULL dereference
(CVE-2019-12259)

TCP Urgent Pointer connect-back state confusion
(CVE-2019-12261)

Handshake Data transfer

Handshake Data transfer

TCP Window

TCP Window

TCP Window

TCP Window

TCP Window

Application Buffer

TCP Window

Application Buffer

int iptcp_usr_get_from_recv_queue(...) {
// Urgent Data is present, but not requested with the MSG_OOB flag if ((int32)(tcb->recv.urg_ptr - len +
tcb->recv.seq_next - sock->ipcom.rcv_bytes) <= 0) {
// Calculate the urgent data offset inside the window, in order to // copy data up to, but not including the urgent data len = tcb->recv.urg_ptr - 1 - tcb->recv.seq_next - sock->ipcom.rcv_bytes; } ... }

int iptcp_usr_get_from_recv_queue(...) {
// Urgent Data is present, but not requested with the MSG_OOB flag if ((int32)(tcb->recv.urg_ptr - len +
tcb->recv.seq_next - sock->ipcom.rcv_bytes) <= 0) {
// Calculate the urgent data offset inside the window, in order to // copy data up to, but not including the urgent data
len} = ltencb=->trceb-c>vr.eucrvg.u_rpgt_rpt-r -1 1- -tctbc-b>->rreeccvv..sseeqq__nneexxtt+ -soscko-c>ki-p>ciomp.crocmv._rbyctve_sb;ytes;
... }

len = tcb->recv.urg_ptr - 1 - tcb->recv.seq_next - sock->ipcom.rcv_bytes; Data that should be received Urgent data Other data in the window

len = tcb->recv.urg_ptr - 1 - tcb->recv.seq_next - sock->ipcom.rcv_bytes; Data that should be received Urgent data Other data in the window

len = tcb->recv.urg_ptr - 1 - seq_start
Data that should be received Urgent data Other data in the window

len = tcb->recv.urg_ptr - 1 - seq_start
Data that should be received Urgent data Other data in the window

len = tcb->recv.urg_ptr - 1 - seq_start
Data that should be received Urgent data Other data in the window

len = tcb->recv.urg_ptr - 1 - seq_start

Data that should be received

Other data in the window

Urgent Pointer = 0 tcb->recv.urg_ptr = seq_start + 0

len = tcb->recv.urg_ptr - 1 - seq_start

Data that should be received

Other data in the window

Urgent Pointer = 0 tcb->recv.urg_ptr = seq_start + 0

len = tcb->recv.urg_ptr - 1 - seq_start

Data that should be received

Other data in the window

Urgent Pointer = 0 tcb->recv.urg_ptr = seq_start + 0

len = seq_start - 1 - seq_start

Data that should be received

Other data in the window

Urgent Pointer = 0 tcb->recv.urg_ptr = seq_start + 0

len = -1
Data that should be received

Other data in the window

Urgent Pointer = 0 tcb->recv.urg_ptr = seq_start + 0

int iptcp_usr_get_from_recv_queue(...) {
// Urgent Data is present, but not requested with the MSG_OOB flag if ((int32)(tcb->recv.urg_ptr - len +
tcb->recv.seq_next - sock->ipcom.rcv_bytes) <= 0) {
// Calculate the urgent data offset inside the window, // in order to copy data up to, but not including the urgent data len = (unsigned int32) -1; } ... }

TCP Window

Application Buffer

TCP Window

char buf = 0; ... recv(socket_fd, &buf, 1);

Application Buffer

TCP Window

char buf = 0; ... recv(socket_fd, &buf, 1);

Application Buffer

Int iptcp_usr_get_from_recv_queue(...) { // Urgent Data is present, but not requested with the MSG_OOB flag if ((int32)(tcb->recv.urg_ptr - len +
tcb->recv.seq_next - sock->ipcom.rcv_bytes) <= 0) {
// Calculate the urgent data offset inside the window, in order to // copy data up to, but not including the urgent data
len = ltencb=->trceb-c>vr.eucrvg.u_rpgt_rpt-r -1 1- -tctbc-b>->rreeccvv..sseeqq__nneexxtt+ -soscko-c>ki-p>ciomp.crocmv._rbyctve_sb;ytes;
} ... }

State seq_next urg_ptr 4 - tuple

IPTCP_STATE_LISTEN NULL NULL
SPORT,DPORT, SRC, DST

State seq_next urg_ptr 4 - tuple

IPTCP_STATE_LISTEN 0 10
SPORT,DPORT, SRC, DST

State seq_next urg_ptr 4 - tuple

IPTCP_STATE_SYN_RCV 1000000 10
SPORT,DPORT, SRC, DST

State seq_next urg_ptr 4 - tuple

IPTCP_STATE_SYN_RCV 1000000 + rcv_bytes 10
SPORT,DPORT, SRC, DST

len = tcb->recv.urg_ptr - 1 ­ tcb->recv.seq_next - sock->ipcom.rcv_bytes;

State seq_next urg_ptr 4 - tuple

IPTCP_STATE_SYN_RCV 1000000 + rcv_bytes 10
SPORT,DPORT, SRC, DST

len = 10 - 1 ­ (1000000 + sock->ipcom.rcv_bytes) - sock->ipcom.rcv_bytes;

State seq_next urg_ptr 4 - tuple

IPTCP_STATE_SYN_RCV 1000000 + rcv_bytes 10
SPORT,DPORT, SRC, DST

len = 9 ­ 1000000;

State seq_next urg_ptr 4 - tuple

IPTCP_STATE_SYN_RCV 1000000 + rcv_bytes 10
SPORT,DPORT, SRC, DST

int iptcp_usr_get_from_recv_queue(...) {
// Urgent Data is present, but not requested with the MSG_OOB flag if ((int32)(tcb->recv.urg_ptr - len +
tcb->recv.seq_next - sock->ipcom.rcv_bytes) <= 0) {
// Calculate the urgent data offset inside the window, // in order to copy data up to, but not including the urgent data len = (unsigned int32) -999991; } ... }

TCP Window

Application Buffer

TCP Window

Application Buffer

Censored
Censored
Censored

Censored Censored

Censored

uint32_t prevSize uint32_t size free_chunk_hdr_t *next free_chunk_hdr_t *prev

uint32_t prevSize uint32_t size mem_part *memPartId uint32_t headGuard

uint32_t prevSize uint32_t size
free_chunk_hdr_t *next free_chunk_hdr_t *prev

uint32_t prevSize uint32_t size mem_part *memPartId uint32_t headGuard

uint32_t prevSize uint32_t size free_chunk_hdr_t *next free_chunk_hdr_t *prev

uint32_t prevSize uint32_t size free_chunk_hdr_t *next free_chunk_hdr_t *prev

uint32_t prevSize uint32_t size free_chunk_hdr_t *next free_chunk_hdr_t *prev

void memPartDeleteFree (mem_part * partId, FREE_CHUNK_HDR * node) {
/* This is called inside an allocation */ ... ((FREE_CHUNK_HDR *)(node->prev))->next = node->next; ((FREE_CHUNK_HDR *)(node->next))->prev = node->prev; ... }

uint32_t prevSize uint32_t size free_chunk_hdr_t *next free_chunk_hdr_t *prev

uint32_t prevSize uint32_t size free_chunk_hdr_t *next free_chunk_hdr_t *prev

void memPartDeleteFree (mem_part * partId, FREE_CHUNK_HDR * node) {
/* This is called inside an allocation */ ... ((FREE_CHUNK_HDR *)(Where))->next = What; ((FREE_CHUNK_HDR *)(What))->prev = Where; ... }
uint32_t prevSize
uint32_t size
free_chunk_hdr_t *next
free_chunk_hdr_t *prev

prev
bytes

Data

prevSize
4 bytes

4 bytes

next
4 bytes

prev
4 bytes

Data

prevSize
4 bytes

size
4 bytes

next
4 bytes

prev
4 bytes

Data

prevSize
4 bytes

prev
bytes

Data

prevSize
4 bytes

4 bytes

next
4 bytes

prev
4 bytes

Data

prevSize
4 bytes

size
4 bytes

next
4 bytes

prev
4 bytes

Data

prevSize
4 bytes

prev
bytes

Data

prevSize
4 bytes

4 bytes

next
4 bytes

prev
4 bytes

Data

prevSize
4 bytes

size
4 bytes

next
4 bytes

prev
4 bytes

Data

prevSize
4 bytes

void memPartDeleteFree (mem_part * partId, FREE_CHUNK_HDR * node)
{ /* This is called inside an allocation */ ... ((FREE_CHUNK_HDR *)(Where))->next = What; ((FREE_CHUNK_HDR *)(What))->prev = Where; ...
}

typedef struct mem_part

{

...

/* alloc hooks */

FUNC_ALLOC_HOOK allocHook; /* hook for memPartAlignedAlloc

*/

FUNC_FREE_HOOK freeHook;

/* hook for memPartFree

*/

FUNC_REALLOC_HOOK reallocHook; /* hook for memPartRealloc

*/

FUNC_DELETE_HOOK deleteHook; /* hook for memPartDelete

*/

void *

hookArg;

/* argument for hooks

*/

...

}

prev
bytes

Data

prevSize
4 bytes

4 bytes

next
4 bytes

prev
4 bytes

Data

prevSize
4 bytes

size
4 bytes

next
4 bytes

prev
4 bytes

Data

prevSize
4 bytes

prev
bytes

Data

prevSize
4 bytes

4 bytes

next
4 bytes

prev
4 bytes

Data

prevSize
4 bytes

size
4 bytes

next
4 bytes

prev
4 bytes

Data

prevSize
4 bytes

