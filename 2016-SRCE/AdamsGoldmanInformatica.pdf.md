Message Fabric for Cyber Defense
IACD / SCRE Focus Group JHU/APL
Feb 16, 2016

The Race to the Exchange
why speed is critical for Capital Markets
Exchange Fast Market Data Feed Handler Execution You won!

GE at 30.16

Got GE at 30.21

Slow Market Data Feed Handler Starting Line

Execution

You lost!

Got GE at 30.45

Case Study: Direct Edge
3rd Largest US Stock Exchange in 2008 (after NYSE and NASDAQ)

Replaced brokers with peer-to-peer message fabric

Consistent Performance & Stability with Record Transaction Volumes

Source: Direct Edge 2008-2009
75% lower latency Increased resiliency

50% reduction in hardware cost Predictable performance

The Race to Respond
why speed is critical for Cyber Defense

Fast Events

Recognize

Attack starts

Respond You won!
Attack failed

Slow Events

Recognize

Starting Line

Respond

You lost!

Attack succeeded

Why a Message Fabric?
· Agility, Adaptability, Reliability, Scalability, Modularity, Maintainability · Different data, different requirements = Use right tool for each job · "Get Left of Boom" = Detect and Respond faster = Latency matters! · Better late than never or better never than late = Choice of quality of service
· e.g., only-latest-matters (no recovery), reliable (only recovery between active
participants), guaranteed (keep data for offline participants too)
· Some data matters to one component; some data matters to all = Choice of patterns · e.g., publish/subscribe, request/response, load-balanced, queuing
· Modularity · Easily integrate new technologies and algorithms into existing system
· Maintainability · Software on commodity hardware = future proof and lowest O&M · Centralized control, distributed components (avoid bottlenecks)
· Build vs. buy · Focus on core competencies!
5

Peer-to-Peer Message Fabric

Sending CPU

Receiving CPU

Application A
Comm
1

Functions handled by modern O/S, CPU, Network and API
· routing · forwarding
· filtering · fan-out · persistence

Application B
Comm
2

"Nothing in the Middle" Data Hop

Network
Just 2 steps to move from A to B!!! Less is more!!

Benefits
· efficient (single data hop) · maximizes performance · no single points of failure
· scalable and flexible · easier to administer

Parallel Persistence®

Sending Application

Persistent Data Stores

Receiving Applications

Parallel Persistence®

Sending Application

Zero System Downtime! Zero Latency Failover!

Persistent Data Stores

Receiving Applications

Parallel Persistence®

Sending Application

Persistent Data Stores

Receiving Applications

Parallel Persistence®

Receiver recovers with no impact to live message stream,
then rejoins the live stream!

Sending Application

Persistent Data Stores

Receiving Applications

Why reliable UDP? Packet loss kills TCP

How can you combine a peer to peer message fabric with standardized interfaces and centralized management?

Streaming data collection...
00:00:46: %LINK-3-UPDOWN: Interface Port-channel1, changed state to up 00:00:47: %LINK-3-UPDOWN: Interface GigabitEthernet0/1, changed state to up 00:00:47: %LINK-3-UPDOWN: Interface GigabitEthernet0/2, changed state to up 00:00:48: %LINEPROTO-5-UPDOWN: Line protocol on Interface Vlan1, changed state to down 00:00:48: %LINEPROTO-5-UPDOWN: Line protocol on Interface GigabitEthernet0/1, changed state to down 2 *Mar 1 18:46:11: %SYS-5-CONFIG_I: Configured from console by vty2 (10.34.195.36) 18:47:02: %SYS-5-CONFIG_I: Configured from console by vty2 (10.34.195.36) *Mar 1 18:48:50.483 UTC: %SYS-5-CONFIG_I: Configured from console by vty2 (10.34.195.36) 00:00:46: %LINK-3-UPDOWN: Interface Port-channel1, changed state to up 00:00:47: %LINK-3-UPDOWN: Interface GigabitEthernet0/1, changed state to up 00:00:47: %LINK-3-UPDOWN: Interface GigabitEthernet0/2, changed state to up 00:00:48: %LINEPROTO-5-UPDOWN: Line protocol on Interface Vlan1, changed state to down 00:00:48: %LINEPROTO-5-UPDOWN: Line protocol on Interface GigabitEthernet0/1, changed state to down 2 *Mar 1 18:46:11: %SYS-5-CONFIG_I: Configured from console by vty2 (10.34.195.36) 18:47:02: %SYS-5-CONFIG_I: Configured from console by vty2 (10.34.195.36) *Mar 1 18:48:50.483 UTC: %SYS-5-CONFIG_I: Configured from console by vty2 (10.34.195.36)

Sense Making

Collection at Scale and Processing at the Edge
Sense Making
Sense Making

Logical data flows mapped to physical nodes
logserver1 logserver2 logserver3 logserver4 logserver5 logserver6 logserver7 logserver8

Summary
· No daemons or servers in delivery path
· Maximize speed and scalability · No single points of failure
· Choice of protocols (data "payload" agnostic)
· TCP, UDP, AMQP, unicast, multicast, shared memory, etc.
· Secure transports, handshakes and storage
· Integrity, with or without confidentiality
· Secure message routing for extended enterprise
· Intelligently bridge segmented networks and applications
· Centralized monitoring (with API)
· Integrated insight from every endpoint (other layers too!)
16

Summary (cont'd)
· Dynamic service and peer discovery
· Move applications without changing configuration or code · Establish data flows out-of-band to minimize overhead
· Full range of qualities of service
· From reliable (best-effort) to durable (guaranteed)
· Standards-based interfaces
· Easily plug in third-party products and services
· Centralized management (with API)
· Configure top-down; implement locally
· No custom hardware or storage required
· Pure software to always run on best infrastructure
17

Thoughts · Message fabric as a sensor ­ self awareness
· Encryption hides bad data from the good guys
· Latency, throughput, reliability trade-offs
· Send more data at once = more throughput, less speed · If data is lost or delayed, how long to wait before giving up? · Better never than late or better late than never? · Reliability doesn't have to slow you down
· Processing at the edge (when can you afford XML?)
18

Thank You!
Gay Adams
gadams@informatica.com cell: 301-980-9148

